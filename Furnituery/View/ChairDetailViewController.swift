//
//  ChairDetailViewController.swift
//  Furnituery
//
//  Created by Gokul Nair on 25/09/20.
//

import UIKit

class ChairDetailViewController: UIViewController {
    
    var image = UIImage()
    var price: Int = 0
    var name: String = ""
    var Description: String = ""

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.itemImage.image = image
        self.itemName.text = name
        self.itemPrice.text = String(price)
        self.itemDescription.text = Description
    }
    
    @IBAction func performARKit(_ sender: Any) {
       let alert = UIAlertController(title: "ARKit", message: "Not Available Now", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func addToCArt(_ sender: Any) {
    }
    
    @IBAction func favourites(_ sender: Any) {
    }
    @IBAction func closeBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
