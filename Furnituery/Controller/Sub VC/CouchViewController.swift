//
//  CouchViewController.swift
//  Furnituery
//
//  Created by Gokul Nair on 24/09/20.
//

import UIKit

class CouchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func exitBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cartBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "toCart", sender: nil)
    }
    
}
