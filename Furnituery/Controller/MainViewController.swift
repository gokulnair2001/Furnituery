//
//  ViewController.swift
//  Furnituery
//
//  Created by Gokul Nair on 22/09/20.
//

import UIKit

class MainViewController: UIViewController {
    
    var arrImageData = [UIImage]()
    var itemName = [String]()
    var price = [Int]()
    var cellColour = [UIColor]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabbar = tabBarController?.tabBar
        
        tabbar!.isTranslucent = true
        tabbar?.barStyle = UIBarStyle(rawValue: 1)!
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
        
        arrImageData = [#imageLiteral(resourceName: "7"),#imageLiteral(resourceName: "4"),#imageLiteral(resourceName: "1"),#imageLiteral(resourceName: "2"),#imageLiteral(resourceName: "6"),#imageLiteral(resourceName: "3"),#imageLiteral(resourceName: "5")]
        itemName = ["Minimal Square Cut Tabel","Organic Picinc Table","Japanese Keelo Table","Smart Design Glass Table ","Smart Design SS Glass Table","Authentic Hindu Table","Cross-Over Square Table"]
        price = [1299,1399,2990,3000,1000,1500,1899]
        cellColour = [#colorLiteral(red: 0.8392156863, green: 0.9333251494, blue: 0.8509803922, alpha: 1),#colorLiteral(red: 0.8392156863, green: 0.862745098, blue: 0.8509803922, alpha: 1),#colorLiteral(red: 0.9395547509, green: 0.9270929694, blue: 0.7370658517, alpha: 1),#colorLiteral(red: 0.8392156863, green: 0.9333251494, blue: 0.8509803922, alpha: 1),#colorLiteral(red: 0.8392156863, green: 0.862745098, blue: 0.8509803922, alpha: 1),#colorLiteral(red: 0.9395547509, green: 0.9270929694, blue: 0.7370658517, alpha: 1),#colorLiteral(red: 0.8392156863, green: 0.9333251494, blue: 0.8509803922, alpha: 1),#colorLiteral(red: 0.8392156863, green: 0.862745098, blue: 0.8509803922, alpha: 1),#colorLiteral(red: 0.9395547509, green: 0.9270929694, blue: 0.7370658517, alpha: 1),#colorLiteral(red: 0.8392156863, green: 0.9333251494, blue: 0.8509803922, alpha: 1),#colorLiteral(red: 0.8392156863, green: 0.862745098, blue: 0.8509803922, alpha: 1),#colorLiteral(red: 0.9395547509, green: 0.9270929694, blue: 0.7370658517, alpha: 1)]
        
    }
   
}


//MARK:- Collectionview Method

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrImageData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MainCollectionViewCell
        cell.imageView.image = arrImageData[indexPath.row]
        cell.nameLbl.text = itemName[indexPath.row]
        cell.priceLbl.text = String(price[indexPath.row])
        cell.backgroundColor = cellColour[indexPath.row]
        cell.layer.cornerRadius = 20
        return cell
    }
    
}


//MARK:- add item method

extension MainViewController{
    @IBAction func addItem(_ sender: Any) {
        self.performSegue(withIdentifier: "addItem", sender: nil)
    }
}


//MARK:- Sort method

extension MainViewController{
    
    @IBAction func sortButton(_ sender: Any) {
        
        let alert = UIAlertController(title: "Sort", message: "Select Any", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "A-Z", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Z-A", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Price (High to Low)", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title:"Price (Low to HIgh)", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
}
