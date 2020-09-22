//
//  ProfileViewController.swift
//  Furnituery
//
//  Created by Gokul Nair on 23/09/20.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
}

//MARK:- Logout Method

extension ProfileViewController{
    
    @IBAction func logOutBtn(_ sender: Any) {
        
        let actionController = UIAlertController(title: nil, message: "Are You sure You want to SignOut", preferredStyle: .actionSheet)
        actionController.addAction(UIAlertAction(title: "SignOut", style: .default, handler: { (_) in
            self.signout()
        }))
        actionController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(actionController, animated: true,completion: nil)
        
    }
    
    func signout() {
        do {
            try Auth.auth().signOut()
            self.navigationController?.popToRootViewController(animated: true)
            
        }
        catch let signouterror as NSError {
            print("error found:\(signouterror)")
        }
    }
}
