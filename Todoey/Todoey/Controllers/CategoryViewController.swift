//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Eric Cabestany Mena on 4/2/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework

class CategoryViewController: SwipeTableViewController {
    
    let realm = try! Realm()
    
    var categoryArray: Results<Category>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategories()
        
        tableView.separatorStyle = .none
        
    }
    override func viewWillAppear(_ animated: Bool) {
        guard let navBar = navigationController?.navigationBar else {fatalError("Navigation controller does not exist.")}
        
        navBar.backgroundColor = UIColor(hexString: K.defaultColorCell)
    }


    //MARK: - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //cridem la super classe
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        let category = categoryArray?[indexPath.row]
        cell.textLabel?.text = category?.name ?? "No Categories added yet"
        guard let categoryColor = UIColor(hexString: category!.color) else {fatalError()}
        cell.textLabel?.textColor = ContrastColorOf(categoryColor, returnFlat: true)
        
        cell.backgroundColor = UIColor(hexString: category?.color ?? K.defaultColorCell)
        
        
        return cell
        
    }
    
    
    
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: K.segueToItems, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListVewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categoryArray?[indexPath.row]
        }
    }
    
    //MARK: - TableView Manipulation Methods
    func save(category: Category) {
       
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Error saving category, \(error)")
        }
    }
    //A la funció loadCategories fem que demani un paràmetre, però li posem un valor per defecte després de "="
    func loadCategories() {
        
        categoryArray = realm.objects(Category.self)
  
     
        tableView.reloadData()
    }
    
    //MARK: - Delete Data from swipe
    
    override func updateModel(at indexPath: IndexPath) {
        if let categorySelected = self.categoryArray?[indexPath.row] {
            do {
                try self.realm.write {
                    self.realm.delete(categorySelected)
                }
            }catch {
               print("Error deleting category, \(error)")
            }
        }
    }
    
    //MARK: - Add New Categories
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var userText = UITextField()
        
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Category", style: .default) { action in
            
            
            
            let newCategory = Category()
            
            newCategory.name = userText.text!
            newCategory.color = UIColor.randomFlat().hexValue()
            
            self.save(category: newCategory)
            
            self.tableView.reloadData()
        }
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Type something"
            userText = alertTextField
            
        }
        alert.addAction(action)
        present(alert, animated: true)
        
    }
    
    
}

