

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var carsTableView: UITableView!
    @IBOutlet weak var carsSearchBar: UISearchBar!
    var filteredCars = [CarModel]()
    var addButton = UIButton(type: .system)
    let data = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubviews()
        filteredCars = data.cars
    }
    func setupSubviews () {
//        carsSearchBar.delegate = self
        carsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "film_cell")
        addButton.setTitleColor(.white, for: .normal)
        addButton.setTitle("+", for: .normal)
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        addButton.layer.cornerRadius = 80/2
        addButton.backgroundColor = .blue
        addButton.addTarget(self, action: #selector(addButtonTap), for: .touchUpInside)
        
        view.addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        addButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }
    @objc func addButtonTap () {
        let alert = UIAlertController(title: "New Car", message: "Which Car To Add ?", preferredStyle: .alert)
        
        var textField = UITextField()
        alert.addTextField { alertTextField in
            textField = alertTextField
        }
        
        let yesAction = UIAlertAction(title: "YES", style: .cancel) { action in
            ()
            let data = ViewController()
            data.cars.insert(textField.text ?? ("new car"), at: 0)
            self.filteredCars = data.cars
            self.carsTableView.reloadData()
        }
        let noAction = UIAlertAction(title: "NO", style: .destructive) { action in
            ()
        }
        alert.addAction(yesAction)
        alert.addAction(noAction)
        present(alert, animated: true)
    }
    
}

extension SecondViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let data = ViewController()
        
//        return data.totalArray.count
        
        return data.cars.count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = ViewController()
        let cell = tableView.dequeueReusableCell(withIdentifier: "car_cell", for: indexPath) as! CarCell
        
        //MARK: не работает (массив не заполняется)
//        cell.cellImage.image = UIImage(named: data.totalArray[indexPath.row].carImage)
//        cell.cellName.text = data.totalArray[indexPath.row].carName
//        cell.cellPrice.text = "\(data.totalArray[indexPath.row].carPrice) $"
        
        cell.cellImage.image = UIImage(named: data.cars[indexPath.row].carImage)
        cell.cellName.text = data.cars[indexPath.row].carName
        cell.cellPrice.text = "\(data.cars[indexPath.row].carPrice) $"
        
        var totalSum = 0
        for _ in data.cars {
            totalSum += data.cars[indexPath.row].carPrice
        }
        
        cell.cellTotal.text = "Общая Сумма: \(totalSum)$"
        
        return cell
    }
}
extension SecondViewController: UITableViewDelegate{
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return  115
        }
        
}

extension SecondViewController:UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredCars = []
        
        if searchText == "" {
            filteredCars = data.cars
        }else{
            for car in data.cars {
                if car.uppercased().contains(searchText.uppercased()) {
                    
                    filteredCars.append(car)
                }
            }
        }
        carsTableView.reloadData()
    }
}


