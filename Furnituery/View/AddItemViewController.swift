//
//  FavouriteViewController.swift
//  Furnituery
//
//  Created by Gokul Nair on 23/09/20.
//

import UIKit

class AddItemViewController: UIViewController {
    
    
    @IBOutlet weak var bedRoomItems: UIButton!
    @IBOutlet weak var tableItems: UIButton!
    @IBOutlet weak var livingRoomitems: UIButton!
    
    @IBOutlet weak var addNameTextField: UITextField!
    @IBOutlet weak var addPriceTextField: UITextField!
    @IBOutlet weak var AdditemImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
   
    let main = MainViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bedRoomItems.layer.cornerRadius = 10
        tableItems.layer.cornerRadius = 10
        livingRoomitems.layer.cornerRadius = 10
        
        AdditemImage.layer.cornerRadius = 20
        AdditemImage.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        AdditemImage.layer.borderWidth = 2
        
    }
    
    @IBAction func closeBtn(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    @IBAction func addItemBtn(_ sender: Any) {
        
        if (addNameTextField.text != "" && addPriceTextField.text != "" && AdditemImage.image != nil) {
            
            self.main.price.append(Int(addPriceTextField.text!)!)
            self.main.itemName.append(addNameTextField.text!)
            self.main.arrImageData.append(AdditemImage.image!)
            
            self.dismiss(animated: true, completion: nil)
        }
        else{
            let alert = UIAlertController(title: "Error", message: "Fields are Empty", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    @IBAction func bedRoomItem(_ sender: Any) {
        categoryLabel.text = "Bedroom Items"
        buttonAnimation(button: bedRoomItems)
    }
    @IBAction func tableItem(_ sender: Any) {
        categoryLabel.text = "Table & Stool Items"
        buttonAnimation(button: tableItems)
    }
    @IBAction func livingRoomItem(_ sender: Any) {
        categoryLabel.text = "Livingroom Items"
        buttonAnimation(button: livingRoomitems)
    }
}

//MARK:- UI Method

extension AddItemViewController
{
    func buttonAnimation(button: UIButton){
        UIView.animate(withDuration: 0.6,
                       animations: {
                        button.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
                       },
                       completion: { _ in
                        UIView.animate(withDuration: 0.6) {
                            button.transform = CGAffineTransform.identity
                        }
                       })
        
    }
}


