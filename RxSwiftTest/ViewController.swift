//
//  ViewController.swift
//  RxSwiftTest
//
//  Created by HenryCheng on 2019/11/28.
//  Copyright © 2019 igancao. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    var tableView: UITableView!
    var todoItems = BehaviorRelay<[TodoItem]>(value: [])
    let bag = DisposeBag()
    var deleteBtn: UIButton = UIButton()
    var addBtn: UIButton = UIButton()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configTableView()
        
        let btn = UIButton.init(type: .custom)
        btn.setTitle("add", for: .normal)
        btn.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        btn.setTitleColor(.red, for: .normal)
        btn.addTarget(self, action: #selector(addTodoItem), for: .touchUpInside)
        addBtn = btn
        let barButtonItem = UIBarButtonItem.init(customView: btn)
        self.navigationItem.rightBarButtonItem = barButtonItem
        
        let leftBtn = UIButton.init(type: .custom)
        leftBtn.setTitle("delete", for: .normal)
        leftBtn.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        leftBtn.setTitleColor(.red, for: .normal)
        leftBtn.addTarget(self, action: #selector(deleteItems), for: .touchUpInside)
        deleteBtn = leftBtn
        let barButtonItem2 = UIBarButtonItem.init(customView: leftBtn)
        self.navigationItem.leftBarButtonItem = barButtonItem2
        
        todoItems.asObservable().subscribe(onNext:{
                [weak self] todos in
                self?.reloadTableView(by: todos)
            }).disposed(by: bag)
        
    }
    
    func reloadTableView(by: [TodoItem]) {
        title = todoItems.value.count == 0 ? "Todos" : "\(todoItems.value.count)Todos"
        deleteBtn.isEnabled = todoItems.value.count > 0
        deleteBtn.setTitleColor(by.count > 0 ? .red : .gray, for: .normal)
        addBtn.isEnabled = todoItems.value.filter{ !$0.isFinished }.count < 5
        addBtn.setTitleColor(todoItems.value.filter{ !$0.isFinished }.count < 5 ? .red : .gray, for: .normal)
        tableView.reloadData()
    }
    @objc func deleteItems() {
        var value = todoItems.value
        value.removeAll()
        todoItems.accept(value)
    }
    
    @objc func addTodoItem() {
        
        let newItem = TodoItem(name: "Love", isFinished: false)
        todoItems.accept(todoItems.value + [newItem])
    }
    
    func configTableView() {
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 88), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: "TodoCell", bundle: nil), forCellReuseIdentifier: "TodoItem")
        self.view.addSubview(tableView)
    }
    


}

