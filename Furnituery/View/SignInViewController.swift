//
//  SignInViewController.swift
//  Furnituery
//
//  Created by Gokul Nair on 22/09/20.
//

import UIKit
import Firebase
import LocalAuthentication

class SignInViewController: UIViewController {
    
    let db = Firestore.firestore()
    let haptic = haptickFeedback()

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBOutlet weak var signInBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signInBtn.layer.cornerRadius = 20
        authenticateUserAndConfigureView()

    }
    

  
    
}

//MARK:- LogIn Method

extension SignInViewController{
    @IBAction func signINButton(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!){(user, error)
            in
            if error == nil
            {
                self.performSegue(withIdentifier: "toMainVC", sender: nil)
                //self.haptic.haptiFeedback1()
                self.clear()
            }
            else
            {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .actionSheet)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                
                alert.addAction(defaultAction)
                self.present(alert, animated: true, completion: nil)
            }
            
        }
        
        
    }
    
    //MARK:- Function to clear textfield after log in
    
    func clear() {
        self.emailTextfield.text?.removeAll()
        self.passwordTextfield.text?.removeAll()
    }
    
}

//MARK:-  Authentication- FaceID/TouchID/textKey

extension SignInViewController {
    
    func authenticateUserAndConfigureView()
    {
        if Auth.auth().currentUser != nil{
            let context:LAContext = LAContext()
            
            if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: nil)
            {
                context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: "Message") { (True, error) in
                    if True
                    {
                        
                        print("sucess")
                        DispatchQueue.main.async {
                            self.navigationController?.isNavigationBarHidden = true
                            
                            self.performSegue(withIdentifier: "toMainVC", sender: nil)
                            self.haptic.haptiFeedback1()
                            
                        }
                        
                    }
                    else
                    {
                        print(error!)
                    }
                }
            }else{
                print("Enter Your Auth ID")
            }
        }
        
    }
    
    
}


    

