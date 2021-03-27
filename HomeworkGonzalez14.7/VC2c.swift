//
//  VC2c.swift
//  HomeworkGonzalez14.7
//
//  Created by Serguei Gonzalez on 3/24/21.
//

import UIKit
import RealmSwift

class ToDoListItem: Object {
    
   @objc dynamic var taskText: String = ""
   
    
}

class VC2c: UIViewController {

    
    private let realm = try! Realm()
    var data = [ToDoListItem]()
    
    @IBOutlet weak var table: UITableView!
    
    @IBAction func didTapAddButton() {
        guard let vc = storyboard?.instantiateViewController(identifier: "VC2c2") as? VC2c2 else{
            return
        }
        vc.completionHandler = {[weak self] in
            self?.refresh()
        }
        vc.title = "New Item"
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func refresh(){
        data = realm.objects(ToDoListItem.self).map ({ $0
        })
        table.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = realm.objects(ToDoListItem.self).map ({ $0
        })
        // Do any additional setup after loading the view.
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.delegate = self
        table.dataSource = self
    }
    

 

}
extension VC2c: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].taskText
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let item = data[indexPath.row]
        
        guard let vc = storyboard?.instantiateViewController(identifier: "VC2c3") as? VC2c3 else{
            return
        }
        
        vc.item = item
        vc.deletionHandler = {[weak self] in
            self?.refresh()
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
        vc.title = item.taskText
    }
    
}
