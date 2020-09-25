//
//  ExploreViewController.swift
//  Furnituery
//
//  Created by Gokul Nair on 23/09/20.
//

import UIKit

class ExploreViewController: UIViewController {

    @IBOutlet weak var ChairView: UIImageView!
    @IBOutlet weak var couchView: UIImageView!
    @IBOutlet weak var loungeView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ChairView.layer.borderWidth = 0.5
        ChairView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        couchView.layer.borderWidth = 0.5
        couchView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        loungeView.layer.borderWidth = 0.5
        loungeView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    @IBAction func chairVCBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "toChairVC", sender: nil)
    }
    
    @IBAction func couchVCBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "toCouchVC", sender: nil)
    }
    @IBAction func loungeVCBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "toLoungeVC", sender: nil)
    }
    @IBAction func cartBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "toCart", sender: nil)
    }
    
}
