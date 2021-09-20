//
//  ProductTableViewCell.swift
//  UnitTest
//
//  Created by hany karam on 9/20/21.
//

import UIKit
import Kingfisher

class ProductTableViewCell: UITableViewCell {
    @IBOutlet weak var HomeView: UIView!
    @IBOutlet weak var titletext: UILabel!
    @IBOutlet weak var imageProgduct: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        HomeView.backgroundColor = UIColor.white
        contentView.backgroundColor = UIColor.white
        HomeView.static_shadow(withOffset: CGSize(width: 0, height: 2), color: #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 0.5))
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func reloadImage(image: Datum) {
        self.imageProgduct.kf.indicatorType = .activity
        if let img = URL(string: image.image ?? ""){
            DispatchQueue.main.async {
                self.imageProgduct.kf.setImage(with: img)
            }
            
        }
    }
    
}
