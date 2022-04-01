//
//  LoginViewController.swift
//  UIList
//
//  Created by Luiz Eduardo Mello dos Reis on 31/03/22.
//

import UIKit

import FirebaseAuth
import FirebaseCore
import FirebaseFirestore
import SwiftUI

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var emailFields: UITextField!
    
    @IBOutlet weak var passwordFields: UITextField!
    
    
    @IBAction func LoginAuth(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailFields.text!, password: passwordFields.text!){(user, error) in
            if error == nil{
                self.performSegue(withIdentifier: "loggedsegue", sender: self)
            }
            else {
                let alertController = UIAlertController(title: "Ops!", message: error?.localizedDescription, preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                               
                 alertController.addAction(defaultAction)
                 self.present(alertController, animated: true, completion: nil)
            }
        }
        
    }
    
    var db: Firestore!
    
    var handle: AuthStateDidChangeListenerHandle?

    override func viewDidLoad() {
        super.viewDidLoad()

        // [START setup]
        let settings = FirestoreSettings()

        Firestore.firestore().settings = settings
        // [END setup]
        db = Firestore.firestore()
    }

    
}
