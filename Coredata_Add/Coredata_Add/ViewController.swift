//
//  ViewController.swift
//  Coredata_Add
//
//  Created by Đỗ Việt on 3/7/17.
//  Copyright © 2017 Do Viet. All rights reserved.
//

import UIKit
//import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var persons: [Person] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
    }

    override func viewWillAppear(_ animated: Bool) {
        getData()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let person = persons[indexPath.row]
        
        if let fullname = person.fullname {
            cell.textLabel?.text = fullname
        }
        
        return cell
    }
    
    func getData() {
        do {
            persons = try context.fetch(Person.fetchRequest())
        } catch {
            print("Fetching Failed")
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            context.delete(persons[indexPath.row])
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do {
                persons = try context.fetch(Person.fetchRequest())
            } catch {
                print("Fetching Failed")
            }
        }
        
        tableView.reloadData()
    }
    
    
    
}
