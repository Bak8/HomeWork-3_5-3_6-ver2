

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var carsTableView: UITableView!
    @IBOutlet weak var carsSearchBar: UISearchBar!
    var filteredCars = [CarModel]()
    var addButton = UIButton(type: .system)
//    let data = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        filteredCars = totalArray
    }
    
    
    func setupSubviews () {
        carsSearchBar.delegate = self
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
            totalArray.insert(CarModel(carImage: "", carName: textField.text ?? "", carPrice: 0), at: 0)
            self.filteredCars = totalArray
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
        return filteredCars.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let data = ViewController()
        let cell = tableView.dequeueReusableCell(withIdentifier: "car_cell", for: indexPath) as! CarCell
        
        cell.cellImage.image = UIImage(named: filteredCars[indexPath.row].carImage)
        cell.cellName.text = filteredCars[indexPath.row].carName
        cell.cellPrice.text = "\(filteredCars[indexPath.row].carPrice) $"
        
        var totalSum = 0
        for _ in filteredCars {
            totalSum += filteredCars[indexPath.row].carPrice
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



// MARK: Не работает
extension SecondViewController:UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        
        if searchText == "" {
            filteredCars = totalArray
        }else{
            for car in totalArray {
                if car.carName.uppercased().contains(searchText.uppercased()) {
                    filteredCars.append(car)
                }
            }
        }
        carsTableView.reloadData()
    }
}


