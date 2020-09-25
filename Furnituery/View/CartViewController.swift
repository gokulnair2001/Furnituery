//
//  CartViewController.swift
//  Furnituery
//
//  Created by Gokul Nair on 25/09/20.
//

import UIKit

class CartViewController: UIViewController{
    
    var ItemName = [String]()
    var itemPrice = [Int]()
    var productImage = [UIImage]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productImage = []
        itemPrice = []
        ItemName = []
        
        tableView.delegate = self
        tableView.dataSource = self
        
       
    }
    

    
    @IBAction func exitButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func clearAllBtn(_ sender: Any) {
        tableView.reloadData()
    }
}

//MARK:- Tableview Method

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productImage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CartViewTableViewCell
        
        cell.itemImage.image = productImage[indexPath.row]
        cell.priceLbl.text = String(itemPrice[indexPath.row])
        cell.nameLbl.text = ItemName[indexPath.row]
        
        return cell
    }
    
    
    
    
}
