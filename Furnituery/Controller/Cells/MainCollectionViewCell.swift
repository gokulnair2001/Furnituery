//
//  MainCollectionViewCell.swift
//  Furnituery
//
//  Created by Gokul Nair on 23/09/20.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLbl:UILabel!
    @IBOutlet var priceLbl:UILabel!
    
    override func awakeFromNib() {
        imageView.layer.cornerRadius = 20
        //imageView.layer.borderWidth = 1
       // imageView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}
