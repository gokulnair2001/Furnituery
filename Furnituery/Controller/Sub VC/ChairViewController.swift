//
//  ChairViewController.swift
//  Furnituery
//
//  Created by Gokul Nair on 24/09/20.
//

import UIKit

class ChairViewController: UIViewController {
    
    var arrImageData = [UIImage]()
    var itemName = [String]()
    var itemPrice = [Int]()
    var descrip = [String]()
    var indexPos = 0

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        arrImageData = [#imageLiteral(resourceName: "c6"),#imageLiteral(resourceName: "c3"),#imageLiteral(resourceName: "c10"),#imageLiteral(resourceName: "c9"),#imageLiteral(resourceName: "c5"),#imageLiteral(resourceName: "c7"),#imageLiteral(resourceName: "c8"),#imageLiteral(resourceName: "c2"),#imageLiteral(resourceName: "c4")]
        itemName = ["Master Chair","Crown Chair","Basic Seal Chair","Crimote Egg Chair","Navy Chair","Pastic Chair","Big Mouth Chair","Eligent Broad Chair","Turtle Chair"]
        itemPrice = [2800,2500,1200,3200,1400,1500,1900,2200,2000]
        descrip = ["","","","","","","","","",""]
        
    }
    
    @IBAction func exitBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cartBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "toCart", sender: nil)
    }
    
}

extension ChairViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrImageData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ChairTableViewCell
        cell.itemImage.image = arrImageData[indexPath.row]
        cell.nameLbl.text = itemName[indexPath.row]
        cell.priceLbl.text = String(itemPrice[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
           func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
             
                   indexPos=indexPath.row
                   performSegue(withIdentifier: "segue", sender: self)
               }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ChairDetailViewController
        vc.Description = self.descrip[indexPos]
        vc.price = self.itemPrice[indexPos]
        vc.name = self.itemName[indexPos]
        vc.image = self.arrImageData[indexPos]
    }
    
}
