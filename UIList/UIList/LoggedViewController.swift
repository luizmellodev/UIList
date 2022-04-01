//
//  LoggedViewController.swift
//  UIList
//
//  Created by Luiz Eduardo Mello dos Reis on 31/03/22.
//

import Foundation


import UIKit

import FirebaseAuth
import FirebaseCore
import FirebaseFirestore
import SwiftUI

class LoggedViewController: UIViewController {
    @IBOutlet weak var welcomeText: UILabel!
    
    @IBAction func SignOutButton(_ sender: Any) {
        do{
            try Auth.auth().signOut()
            self.dismiss(animated: true)
        } catch let signOutError as NSError {
            print(signOutError)
        }
    }
}
