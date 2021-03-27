//
//  VC3.swift
//  HomeworkGonzalez14.7
//
//  Created by Serguei Gonzalez on 3/24/21.
//

import UIKit

class VC3: UIViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private var models = [ToDoListHere]()
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "CoreData To Do List"
        view.addSubview(tableView)
        getAllItems()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        // Do any additional setup after loading the view.
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
    }
//Добавить всплывающее окно по нажатию Add
    
    @objc private func didTapAdd() {
        let alert = UIAlertController(title: "New Item", message: "Enter New Item", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Submit", style: .cancel, handler: { [weak self] _ in
            guard let field = alert.textFields?.first, let text = field.text, !text.isEmpty else {return
                }
            self?.createItem(name: text)
        }))
        
        present(alert, animated: true, completion: nil)
    }
    
    
    
//CoreData functions
    
    func getAllItems() {
        do {
            models = try context.fetch(ToDoListHere.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        catch {
        }
    }
    
    func createItem(name: String){
        let newItem = ToDoListHere(context: context)
        newItem.taskText = name
        newItem.createdAt = Date()
        do{
            try context.save()
            getAllItems()
        }
        catch {
        }
    }
    func deleteItem(item: ToDoListHere){
        context.delete(item)
        do{
            try context.save()
            getAllItems()
        }
        catch {
        }
    }
    
    func updateItem(item: ToDoListHere, newName: String){
        item.taskText = newName
        do{
            try context.save()
            getAllItems()
        }
        catch {
        }
    }
    
}

extension VC3: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model.taskText
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
// добавить всплывающее окно для удаления
        
        let item = models[indexPath.row]
        let sheet = UIAlertController(title: "Edit", message: nil, preferredStyle: .actionSheet)
        
        sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        sheet.addAction(UIAlertAction(title: "Edit", style: .default, handler: { _ in
            
            let alert = UIAlertController(title: "Edit Item", message: "Edit your item", preferredStyle: .alert)
            alert.addTextField(configurationHandler: nil)
            alert.textFields?.first?.text = item.taskText
            alert.addAction(UIAlertAction(title: "Save", style: .cancel, handler: { [weak self] _ in
                guard let field = alert.textFields?.first, let newName = field.text, !newName.isEmpty else {return
                    }
                self?.updateItem(item: item, newName: newName)
            }))
            
            self.present(alert, animated: true, completion: nil)
        }))
        sheet.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { [weak self] _ in self?.deleteItem(item: item)
        }))
        
        present(sheet, animated: true, completion: nil)
    }
    
    
}
