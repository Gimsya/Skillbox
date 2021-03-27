//
//  VC2b.swift
//  HomeworkGonzalez14.7
//
//  Created by Serguei Gonzalez on 3/24/21.
//

import UIKit

class VC2b: UIViewController {

    var data = [ToDoList]()
//    var item: ToDoList?

    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var taskTF: UITextField!
    
    
    @IBAction func deleteButton(_ sender: UIButton) {
        let point = sender.convert(CGPoint.zero, to: tableView)
        guard let indexpath = tableView.indexPathForRow(at: point) else {return}
        
        // удаление из Realm
        let dataDelete = self.data[indexpath.row]
        Persistance.shared.realm.beginWrite()
        Persistance.shared.realm.delete(dataDelete)
        try! Persistance.shared.realm.commitWrite()

        
        //для анимации удаления
        data.remove(at: indexpath.row)
        tableView.deleteRows(at: [IndexPath(row: indexpath.row, section: 0)], with: .left)

        refresh()
    }
    
    
    @IBAction func addTask(_ sender: Any) {
        if let text = taskTF.text, !text.isEmpty{
            Persistance.shared.realm.beginWrite()
            
            let newTask = ToDoList()
            newTask.taskText = text
            Persistance.shared.realm.add(newTask)
            
            try! Persistance.shared.realm.commitWrite()
            
            refresh()
        }
        else {
            print ("Write something")
        }
        
    }
    func refresh(){
        data = Persistance.shared.realm.objects(ToDoList.self).map ({ $0
        })
        tableView.reloadData()
       
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data = Persistance.shared.realm.objects(ToDoList.self).map ({ $0
        })
        tableView.delegate = self
        tableView.dataSource = self

        
        // Do any additional setup after loading the view.
    
    }

}

extension VC2b: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VC2bCell", for: indexPath) as! VC2bCell
        cell.cellLabel.text = data[indexPath.row].taskText
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
