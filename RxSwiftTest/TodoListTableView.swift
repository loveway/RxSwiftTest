//
//  TodoListTableView.swift
//  RxSwiftTest
//
//  Created by HenryCheng on 2019/11/29.
//  Copyright © 2019 igancao. All rights reserved.
//

import UIKit

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            let todo = todoItems.value[indexPath.row]
            todo.toggleFinished()
            var value = todoItems.value
            value[indexPath.row] = todo
            todoItems.accept(value)
            configureStatus(for: cell as! TodoCell , with: todo)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItem", for: indexPath) as! TodoCell
        let todo = todoItems.value[indexPath.row]
        configureStatus(for: cell, with: todo)
        configureLabel(for: cell, with: todo)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems.value.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        var value = todoItems.value
        value.remove(at: indexPath.row)
        todoItems.accept(value)
    }
}
