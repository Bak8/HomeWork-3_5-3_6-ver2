
import Foundation
import UIKit

class ImageCell2 : UICollectionViewCell {
    
    @IBOutlet weak var carNameCell: UILabel!
    @IBOutlet weak var imageView2 : UIImageView!
    @IBOutlet weak var carPriceCell: UILabel!
    
    var carAmount = -1
    var wasChoosen : Bool = false
    var cornerRadius: CGFloat = 5.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Apply rounded corners to contentView
        contentView.layer.cornerRadius = cornerRadius
        contentView.layer.masksToBounds = true
        
        // Set masks to bounds to false to avoid the shadow
        // from being clipped to the corner radius
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = false
        
        // Apply a shadow
        layer.shadowRadius = 8.0
        layer.shadowOpacity = 0.10
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 5)
    }
    
    
    override func layoutSubviews() {
        
        layer.shadowPath = UIBezierPath(
            roundedRect: bounds,
            cornerRadius: cornerRadius
        ).cgPath
        
        imageView2.layer.cornerRadius = 5
//        imageView2.isUserInteractionEnabled = true
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(amountTap))
        imageView2.addGestureRecognizer(tap)
        
    }
    
    
    @objc func amountTap () -> Int{
        carAmount += 1
        return carAmount
    }


  
    
    
    
//    @objc func amountTap () -> Int{
//
//        if wasChoosen == false {
//            carAmount += 1
//            //            wasChoosen = true
//            print(carAmount)
//        }
//        else{
//            wasChoosen = false
//            carAmount -= 1
//            print(carAmount)
//
//        }
//        return carAmount
//    }
}



