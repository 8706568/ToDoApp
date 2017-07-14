//
//  DisplayViewController.swift
//  toDoApp
//
//  Created by camille_mille on 2017/7/7.
//  Copyright © 2017年 camille_mille. All rights reserved.
//


import UIKit


class DisplayViewController: UIViewController {
   
    @IBOutlet weak var descriptionContent: UITextView!
    @IBOutlet weak var toDoName: UITextField!
    
    var toDo: ToDo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "save" {
           
            let toDo = self.toDo ?? CoreDataHelper.newToDo()
            toDo.nameLabel = toDoName.text ?? ""
            toDo.descriptionLabel = descriptionContent.text ?? ""
            toDo.timeLabel = Date() as NSDate
            CoreDataHelper.saveToDo()
        }
        
    }
    
    
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let toDO = toDo {
            // 2
            toDoName.text = toDO.nameLabel
           descriptionContent.text = toDO.descriptionLabel
        } else {
            // 3
            toDoName.text = ""
            descriptionContent.text = ""
        }    }
    


}
