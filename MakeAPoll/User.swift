//
//  User.swift
//  MakeAPoll
//
//  Created by Jay Patel on 7/6/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot

class User {
    
    let uid: String
    let welcome: String
    
    
    init(uid: String, welcome: String) {
        self.uid = uid
        self.welcome = welcome
    }
   
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let welcome = dict["welcome"] as? String
            else { return nil }
        
        self.uid = snapshot.key
        self.welcome = welcome
    }
}
