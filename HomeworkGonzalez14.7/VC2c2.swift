//
//  VC2c2.swift
//  HomeworkGonzalez14.7
//
//  Created by Serguei Gonzalez on 3/24/21.
//

import UIKit
import RealmSwift


class VC2c2: UIViewController {

    @IBOutlet var textField: UITextField!
    
    private let realm = try! Realm()
    public var completionHandler: (() -> Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.becomeFirstResponder()
        textField.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSaveButton))
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @objc func didTapSaveButton(){
        if let text = textField.text, !text.isEmpty{
            realm.beginWrite()
            
            let newItem = ToDoListItem()
            newItem.taskText = text
            realm.add(newItem)
            
            try! realm.commitWrite()
            
            completionHandler?()
            navigationController?.popToRootViewController(animated: true)
        }
        else {
            print ("Write something")
        }
    }

 
}
extension VC2c2: UITextFieldDelegate{
    
}
