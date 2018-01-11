//
//  ViewController.swift
//  Todoey
//
//  Created by Thita on 1/9/18.
//  Copyright © 2018 Thita Charon. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["Light jacket", "Compass", "Head phone", "flashlight"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row])
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else{
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true) //make a flash on selection
    }
    
    
//
//    // MARK add New Items
    @IBAction func addButtonPress(_ sender: UIBarButtonItem) {
  
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todo item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            print("success!")
            
            self.itemArray.append(textField.text!) // new item will append to the itemArray but not yet diapaly on screen, call reload data
        
            self.tableView.reloadData()
           
        }
        // add text field in alert viewcontroller
        alert.addTextField { (alertTextfield) in
            alertTextfield.placeholder = "Create a new item"
            textField = alertTextfield
            print("alert trigger")
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    // continue on section 236
 
}
