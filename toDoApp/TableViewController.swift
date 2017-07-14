//
//  ViewController.swift
//  toDoApp
//
//  Created by camille_mille on 2017/7/7.
//  Copyright © 2017年 camille_mille. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController{
    
    var toDos = [ToDo](){
        didSet {
            tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toDos = CoreDataHelper.retrieveToDo()

        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "display" {
                print("Table view cell tapped")
                
                let indexPath = tableView.indexPathForSelectedRow!
                // 2
                let toDo = toDos[indexPath.row]
                // 3
                let displayViewController = segue.destination as! DisplayViewController
                // 4
                displayViewController.toDo = toDo
                
            } else if identifier == "add" {
                print("+ button tapped")
            }

        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        // 2
        let timeLabel = toDos[indexPath.row].timeLabel
        cell.nameLabel.text = toDos[indexPath.row].nameLabel
        cell.timeLabel.text = timeLabel?.convertToString()
        
        
        
        
        return cell
    }
    
    
    
    @IBAction func unwindViewController(_ segue: UIStoryboardSegue) {
        self.toDos = CoreDataHelper.retrieveToDo()
        
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        // 2
        if editingStyle == .delete {
            // 3
            CoreDataHelper.delete(toDo: toDos[indexPath.row])
            toDos = CoreDataHelper.retrieveToDo()
        }
    }
}

