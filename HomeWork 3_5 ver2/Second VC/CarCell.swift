

import Foundation
import UIKit

class CarCell : UITableViewCell {
    
    @IBOutlet weak var cellImage : UIImageView!
    
    @IBOutlet weak var cellName : UILabel!
    
    @IBOutlet weak var cellPrice : UILabel!
    
    @IBOutlet weak var cellTotal : UILabel!
    
    override func layoutSubviews() {
        cellImage.layer.cornerRadius = 7
        cellImage.layer.borderWidth = 0.2
    }
    
}


