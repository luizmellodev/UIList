//
//  ViewController.swift
//  UIList
//
//  Created by Luiz Eduardo Mello dos Reis on 28/03/22.
//

import UIKit

import FirebaseAuth
import FirebaseCore
import FirebaseFirestore
import SwiftUI

class ViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var senhaField: UITextField!
    
    
    
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
    
    @IBAction func criarButton(_ sender: Any) {
        createUserAuth()
        addNewUser()
    }
    

    
    
    private func createUserAuth() {
        Auth.auth().createUser(withEmail: emailField.text!, password: senhaField.text!) { authResult, error in
          if let error = error as? NSError {
            print("Error: \(error.localizedDescription)")
          } else {
            print("User signs up successfully")
            let newUserInfo = Auth.auth().currentUser
            let email = newUserInfo?.email
          }
        }
    }
    
    private func addNewUser() {
        // [START add_ada_lovelace]
        // Add a new document with a generated ID
        var ref: DocumentReference? = nil
        ref = db.collection("users").addDocument(data: [
            "nome": "\(emailField.text!)",
            "senha": "\(senhaField.text!)"
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
                self.performSegue(withIdentifier: "signupdone", sender: self)
            }
        }
    }
}

