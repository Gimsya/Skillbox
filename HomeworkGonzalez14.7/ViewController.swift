//
//  ViewController.swift
//  HomeworkGonzalez14.7
//
//  Created by Serguei Gonzalez on 3/24/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTFText: UITextField!
    @IBAction func nameTextField(_ sender: Any) {
        Ud2a.shared.userName = nameTFText.text
        print (Ud2a.shared.userName)
    }
    
    @IBOutlet weak var surnameTFText: UITextField!
    
    @IBAction func surnameTextField(_ sender: Any) {Ud2a.shared.userSurname = surnameTFText.text
        print (Ud2a.shared.userSurname)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameTFText.text = Ud2a.shared.userName
        surnameTFText.text = Ud2a.shared.userSurname
    }


}

