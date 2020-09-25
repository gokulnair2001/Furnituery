//
//  TableViewCell.swift
//  Furnituery
//
//  Created by Gokul Nair on 24/09/20.
//

import UIKit

class ChairTableViewCell: UITableViewCell {
    
    @IBOutlet var itemImage: UIImageView!
    @IBOutlet var nameLbl:UILabel!
    @IBOutlet var priceLbl:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
