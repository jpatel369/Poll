//
//  HomeViewController.swift
//  MakeAPoll
//
//  Created by Jay Patel on 7/5/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UITableViewController
{
    
    @IBOutlet weak var addPollbutton: UIBarButtonItem!
    
    @IBAction func addPollButtonTapped(_ sender: UISegmentedControl){
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListPollsTableViewCell", for: indexPath)
        
        cell.textLabel?.text = "Yaaay polling!"
        
        return cell
    }
    
}



