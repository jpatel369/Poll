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


typealias FIRUser = FirebaseAuth.User
class RealLoginViewController: UIViewController{
    @IBOutlet weak var loginButton: UIButton!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            //New repo
            
            //secondary branch change
            
            // Do any additional setup after loading the view, typically from a nib.
            
            UIApplication.shared.statusBarStyle = .lightContent
        }
        
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        guard let authUI = FUIAuth.defaultAuthUI()
            else { return }
        
        
        authUI.delegate = self
        
        
        let authViewController = authUI.authViewController()
        present(authViewController, animated: true)
    }
   
    
}

extension RealLoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith user: FIRUser?, error: Error?) {
        if let error = error {
            assertionFailure("Error signing in: \(error.localizedDescription)")
            return
        }
        
        print("handle user signup / login")
    }
}
