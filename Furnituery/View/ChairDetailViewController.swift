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
    var count = 1

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    
    @IBOutlet weak var cartBtn: UIButton!
    @IBOutlet weak var favBtn: UIButton!
    
    let cartDelegate = CartViewController()
    
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
        count = count + 1
        if count%2 == 0 {
            buttonAnimation(button: cartBtn)
            cartBtn.setImage(UIImage(systemName: "bag.fill"), for: .normal)
            
            cartDelegate.ItemName.append(itemName.text!)
           // cartDelegate.itemPrice.append(itemPrice.text!)
            cartDelegate.productImage.append(itemImage.image!)
            
        }else{
            buttonAnimation(button: cartBtn)
            cartBtn.setImage(UIImage(systemName: "bag.badge.plus"), for: .normal)
            cartDelegate.ItemName.remove(at: cartDelegate.ItemName.firstIndex(of: itemName.text!)!)
            
            cartDelegate.productImage.remove(at: cartDelegate.productImage.firstIndex(of: itemImage.image!)!)
            
        }
    }
    
    @IBAction func favourites(_ sender: Any) {
        count = count + 1
        if count%2 == 0 {
            buttonAnimation(button: favBtn)
            favBtn.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }else{
            buttonAnimation(button: favBtn)
            favBtn.setImage(UIImage(systemName: "heart"), for: .normal)
        }
        
    }
    @IBAction func closeBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}


extension ChairDetailViewController{
    
    func buttonAnimation(button: UIButton){
        UIView.animate(withDuration: 0.6,
        animations: { button.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        },
        completion: { _ in
        UIView.animate(withDuration: 0.6) {button.transform = CGAffineTransform.identity
        }
    })
  }
}
