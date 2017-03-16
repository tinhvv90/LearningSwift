//
//  AddPersonViewController.swift
//  Coredata_Add
//
//  Created by Đỗ Việt on 3/7/17.
//  Copyright © 2017 Do Viet. All rights reserved.
//

import UIKit

class AddPersonViewController: UIViewController {

    @IBOutlet weak var fullNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Save(_ sender: UIButton) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let person = Person(context: context)
        
        person.fullname = fullNameTextField.text
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()

        let _ = navigationController?.popViewController(animated: true)
    }

}
