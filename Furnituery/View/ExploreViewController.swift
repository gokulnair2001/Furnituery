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

        // Do any additional setup after loading the view.
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
