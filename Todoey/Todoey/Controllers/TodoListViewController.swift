//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework

class TodoListVewController: SwipeTableViewController {
    
    var todoItems: Results<Item>?
    let realm = try! Realm()
    
    @IBOutlet weak var searchBar: UISearchBar!

    
    var selectedCategory : Category? {
        didSet{
            loadItems()
        }
    }
    
   
    //let defaults = UserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//            print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        //print(dataFilePath)
        
//        loadItems()
        
        tableView.separatorStyle = .none
        
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    
        if let colorHex = selectedCategory?.color {
            title = selectedCategory!.name
            
            guard let navBar = navigationController?.navigationBar else {fatalError("Navigation controller does not exist.")}
            
            if let navColor = UIColor(hexString:colorHex) {
                searchBar.barTintColor = navColor
                navBar.backgroundColor = navColor
                navBar.tintColor = ContrastColorOf(navColor, returnFlat: true)
                navBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: ContrastColorOf(navColor, returnFlat: true)]
                
            }
        }
    }
    
    //MARK: - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
//        let cell = tableView.dequeueReusableCell(withIdentifier: K.genericCell, for: indexPath)
        
        if let item = todoItems?[indexPath.row] {
            
            cell.textLabel?.text = item.title
            if let color = UIColor(hexString: selectedCategory!.color)?.darken(byPercentage:CGFloat(indexPath.row) / CGFloat(todoItems!.count)) {
                cell.backgroundColor = color
                cell.textLabel?.textColor = ContrastColorOf(color, returnFlat: true)
            }
            
            cell.accessoryType = item.done ? .checkmark : .none
        } else {
            cell.textLabel?.text = "No items added yet"
        }
        return cell
    }
    
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let item = todoItems?[indexPath.row]{
            do {
                try realm.write{
                    item.done = !item.done
                    //realm.delete(item)
                }
            }catch {
               print("Error saving done status, \(error)")
            }
        }
            
//        context.delete(itemArray[indexPath.row])
//        itemArray.remove(at: indexPath.row)

//        todoItems[indexPath.row].done = !itemArray[indexPath.row].done
//
//        saveItems()
//
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
    
    override func updateModel(at indexPath: IndexPath) {
        if let item = self.todoItems?[indexPath.row] {
            do {
                try self.realm.write {
                    self.realm.delete(item)
                }
            }catch {
               print("Error deleting item, \(error)")
            }
        }
    }
    
    //MARK - Add new items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var userText = UITextField()
        
        let alert = UIAlertController(title: "Add new Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { action in
            
            
            
            
            if let currentCategory = self.selectedCategory {
                do {
                    try self.realm.write {
                        let newItem = Item()
                        newItem.title = userText.text!
                        newItem.dateCreated = Date()
                        currentCategory.items.append(newItem)
                        
                    }
                } catch {
                    print("Error saving category, \(error)")
                }
            }
            
            self.tableView.reloadData()
        }
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Type something"
            userText = alertTextField
            
        }
        alert.addAction(action)
        present(alert, animated: true)
        
    }
    
  
    //A la funció loadItems fem que demani un paràmetre, però li posem un valor per defecte després de "=" i amb el predricate fem el mateix (predicate és la query o filtre)
    func loadItems() {

        todoItems = selectedCategory?.items.sorted(byKeyPath: "title", ascending: true)
        
        tableView.reloadData()
    }
  
}

//MARK: - Search bar methods
extension TodoListVewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        todoItems = todoItems?.filter("title CONTAINS[cd] %@", searchBar.text!).sorted(byKeyPath: "dateCreated", ascending: true)
        tableView.reloadData()
        
    }
    //Fem que la searchbar retorni tots els valors de la llista si eliminem tots els caràcters que hem buscat
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            loadItems()
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }

        }
    }
    
    
    
    
}
