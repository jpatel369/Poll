//
//  RealLoginViewController.swift
//  MakeAPoll
//
//  Created by Jay Patel on 7/5/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseAuthUI
import FirebaseDatabase


typealias FIRUser = FirebaseAuth.User
class RealLoginViewController: UIViewController{
    
    @IBOutlet weak var loginButton: UIButton!
    
    
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            //New repo
            
            //secondary branch change
            
            //try
            
            // Do any additional setup after loading the view, typically from a nib.
            
            UIApplication.shared.statusBarStyle = .lightContent
        }
        
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        guard let authUI = FUIAuth.defaultAuthUI()
            else { return }
        
        
        authUI.delegate = self
        
        
        let authViewController = authUI.authViewController()
        present(authViewController, animated: true)
        
        let initialViewController = UIStoryboard.initialViewController(for: .main)
        self.view.window?.rootViewController = initialViewController
        self.view.window?.makeKeyAndVisible()

    }
   
    
}

extension RealLoginViewController: FUIAuthDelegate {

    func authUI(_ authUI: FUIAuth, didSignInWith user: FIRUser?, error: Error?) {
        if let error = error {
            assertionFailure("Error signing in: \(error.localizedDescription)")
        }
        
        // 1
        guard let user = user
            else { return }
        
        // 2
        let userRef = Database.database().reference().child("users").child(user.uid)
    
        userRef.observeSingleEvent(of: .value, with: { [unowned self] (snapshot) in
            if let user = User(snapshot: snapshot) {
                print("Welcome back, \(user.welcome).")
            } else {
                self.performSegue(withIdentifier: "toCreateUsername", sender: self)
            }
        })
    }
}
