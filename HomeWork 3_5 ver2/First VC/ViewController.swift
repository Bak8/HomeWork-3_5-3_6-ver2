//
//  ViewController.swift
//  HomeWork 3_5 ver2
//
//  Created by Atai Begaliev on 5/12/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageCollectionView: UICollectionView!
    
    var floatingButton = UIButton()
    
//    @IBAction  func floatingButton (_ sender:Any) {
//        let secondVC = storyboard?.instantiateViewController(withIdentifier: "second_VC") as! SecondViewController
//        navigationController?.pushViewController(secondVC, animated: true)
//    }
//
    
    
    var count = 0
    var totalSum = 0
    var textField = UITextField()
    
   
    
   
    
    
    
    
    var cars : [CarModel] = [CarModel(carImage: "MCLAREN", carName: "Mclaren 720", carPrice: 700),CarModel(carImage: "Camry", carName: "Toyota Camry", carPrice: 100),CarModel(carImage: "BMW7", carName: "BMW 7", carPrice: 300),CarModel(carImage: "BMWX6", carName: "BMW X6", carPrice: 350),CarModel(carImage: "BMWM3", carName: "BMW M3", carPrice: 280),CarModel(carImage: "AMGGT", carName: "MBZ GT", carPrice: 500), CarModel (carImage: "MCLAREN", carName: "Mclaren 720", carPrice: 700),CarModel(carImage: "Camry", carName: "Toyota Camry", carPrice: 100),CarModel(carImage: "BMW7", carName: "BMW 7", carPrice: 300),CarModel(carImage: "BMWX6", carName: "BMW X6", carPrice: 350),CarModel(carImage: "BMWM3", carName: "BMW M3", carPrice: 280),CarModel(carImage: "AMGGT", carName: "MBZ GT", carPrice: 500)]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        imageCollectionView.collectionViewLayout = layout
        layout.minimumLineSpacing = 10
        //        layout.minimumInteritemSpacing = 0
        
        imageCollectionView.translatesAutoresizingMaskIntoConstraints = false
        imageCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        imageCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        
        //        view.addSubview(imageCollectionView)
        
        
        
        //MARK: - BUTTON
        view.addSubview(floatingButton)
        floatingButton.translatesAutoresizingMaskIntoConstraints = false
        floatingButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive=true
        floatingButton.centerYAnchor.constraint(equalTo: view.bottomAnchor, constant: -60).isActive=true
        floatingButton.heightAnchor.constraint(equalToConstant: 40).isActive=true
        floatingButton.widthAnchor.constraint(equalToConstant: 250).isActive=true
        floatingButton.backgroundColor = .gray
        floatingButton.layer.cornerRadius = 20
        
        //MARK: НЕ РАБОТАЕТ ПЕРЕХОД НА ВТОРОЙ ЭКРАН
        floatingButton.addTarget(self, action: #selector (openSecondView), for: .touchUpInside)
    }
    @objc   func openSecondView () {
        let secondVC = SecondViewController()
        navigationController?.pushViewController(secondVC, animated: true)
//        show(secondVC, sender: self)
        
    }

}

extension ViewController:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cars.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "image_cell2", for: indexPath) as! ImageCell2
        
        cell.imageView2.image = UIImage(named:cars[indexPath.row].carImage)
        cell.carNameCell.text = cars[indexPath.row].carName
        cell.carPriceCell.text = "Цена: \(cars[indexPath.row].carPrice) $"
        
//        floatingButton.setTitle("Количество Машин: \(count)", for: .normal)
     return cell
    }
    
    
    
}

// MARK: CELL AND BUTTON
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 170)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        count += 1
        floatingButton.setTitle("Количество Машин: \(count)", for: .normal)
        totalArray.append(cars[indexPath.row])
        print(totalArray)
//                imageCollectionView.reloadData()
        
    }

}



//
