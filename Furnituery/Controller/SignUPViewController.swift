//
//  SignUPViewController.swift
//  Furnituery
//
//  Created by Gokul Nair on 22/09/20.
//

import UIKit
import Firebase
import MessageUI

class SignUPViewController: UIViewController {
    
    let db = Firestore.firestore()
    let haptic = haptickFeedback()


    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailIDTextfield: UITextField!
    @IBOutlet weak var mobileNoTextfield: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPassTextField: UITextField!
   
    
    @IBOutlet weak var signUPButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        signUPButton.layer.cornerRadius = 20
    }
    

    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func issueBtn(_ sender: Any) {
        facingIssue()
    }
    
}

//MARK:- ValidatingFields

extension SignUPViewController{
    func validateFields() -> String? {
        
        //Field Validating code
        
        if(nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" && emailIDTextfield.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" && mobileNoTextfield.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" && passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" && confirmPassTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "")
        {
            return "Make Sure fields are not empty and full fills the criteria as mentioned"
        }
        // Email Validatinf Code
        
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if utilities.isPasswordValid(cleanedPassword) == false {
            return "Password must have one Lower and Upper Case one Number and One Symbol"
        }
        
        // Password validationg code
        if confirmPassTextField.text != passwordTextField.text {
            return "Password and Confirm Password are not same"
        }
        
        //MobileNumber check
        if mobileNoTextfield.text!.count != 10 {
            return "Mobile Number Must Be Of 10 Digits"
        }
        
        return nil
    }
}

//MARK:- SignUp Methods

extension SignUPViewController{
    
    @IBAction func signUpBtn(_ sender: Any) {
        
        let error = validateFields()
        if error != nil {
            let alert = UIAlertController(title: "Check Your Fields", message: "\(error!)", preferredStyle: .actionSheet)
            
            alert.addAction( UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            
            Auth.auth().createUser(withEmail: (emailIDTextfield.text?.trimmingCharacters(in: .whitespacesAndNewlines))!, password: (passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines))!){
                (result , error) in
                //MARK:- MOST IMPORTANT LINE OF CODE TO LINK UID AND DOC.ID TO LINK BOTH OF THEM
                
                let UID = Auth.auth().currentUser?.uid
                let collection = self.db.collection(Furnituery.FStore.collectionname).document(UID!)
                
                if error == nil {
                    
                   
                    
                    if let name = self.nameTextField.text,
                        let phoneNo = self.mobileNoTextfield.text,
                        let signInUser = Auth.auth().currentUser?.email{
                        
                        collection.setData([
                            
                            Furnituery.FStore.emailId: signInUser,
                            Furnituery.FStore.userName: name,
                            Furnituery.FStore.number: phoneNo,
                            ])
                        {
                            
                            (error) in
                            if let e = error {
                                print("There got some kind of issue,\(e)")
                            }
                            else{
                                //saveFIRStorageData()
                                print("Sucessfuly saved!!")
                                self.clear()
                            }
                        }
                    }
                    
                    
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "tomain", sender: nil)
                        self.clear()
                    }
                    
                }
                else
                {
                    let alertController = UIAlertController (title: "Error",
                                                             message: error?.localizedDescription,
                                                             preferredStyle: .actionSheet)
                    
                    alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alertController, animated: true, completion: nil)
                }
                
            }
        }
        
        
        
    }
    
    
}

//MARK:- Utilities

extension SignUPViewController {
    
    //MARK:- CLEAR FIELD ONCE SIGNED IN
    
    func clear() {
        self.nameTextField.text?.removeAll()
        self.confirmPassTextField.text?.removeAll()
        self.passwordTextField.text?.removeAll()
        self.emailIDTextfield.text?.removeAll()
        self.mobileNoTextfield.text?.removeAll()
    }
}

//MARK:- Email Setup

extension SignUPViewController: MFMailComposeViewControllerDelegate{
    func facingIssue() {
        guard MFMailComposeViewController.canSendMail() else {
            
            return
        }
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setToRecipients(["gokulnair.2001@gmail.com"])
        composer.setSubject("Facing Issue")
        composer.setMessageBody("Hi Gokul, I am facing an issue while signing Up the formalities", isHTML: false)
        
        present(composer, animated: true)
    }
    
    
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if let _ = error {
            controller.dismiss(animated: true, completion: nil)
            return
        }
        switch result {
        case .cancelled:
            print("cancelled")
        case .failed:
            print("failed")
        case .saved:
            print("saved")
        case .sent:
            print("sent")
        @unknown default:
            print("other error")
        }
        controller.dismiss(animated: true, completion: nil)
    }
}

