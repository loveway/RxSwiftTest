//
//  DetailViewController.swift
//  RxSwiftTest
//
//  Created by HenryCheng on 2019/12/4.
//  Copyright © 2019 igancao. All rights reserved.
//

import UIKit
import RxSwift


class DetailViewController: UIViewController {
    
    var detailView: DetailView1!
    fileprivate let todoSubject = PublishSubject<TodoItem>()
    var todo: Observable<TodoItem> {
        return todoSubject.asObserver()
    }
    var todoItem: TodoItem!
    let bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailView = Bundle.main.loadNibNamed("DetailView1", owner: nil, options: nil)?.last as? DetailView1
        view.addSubview(detailView)
        view.backgroundColor = .white
        
        
        let leftBtn = UIButton.init(type: .custom)
        leftBtn.setTitle("cancel", for: .normal)
        leftBtn.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        leftBtn.setTitleColor(.red, for: .normal)
        leftBtn.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        let barButtonItem2 = UIBarButtonItem.init(customView: leftBtn)
        self.navigationItem.leftBarButtonItem = barButtonItem2

        
        let btn = UIButton.init(type: .custom)
        btn.setTitle("add", for: .normal)
        btn.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        btn.setTitleColor(.red, for: .normal)
        btn.addTarget(self, action: #selector(add), for: .touchUpInside)
        let barButtonItem = UIBarButtonItem.init(customView: btn)
        self.navigationItem.rightBarButtonItem = barButtonItem
        
        detailView.taskTextField.rx.text.subscribe(onNext: { text in
            
            btn.isEnabled = !(text?.isEmpty ?? true)
            btn.setTitleColor(!(text?.isEmpty ?? true) ? .red : .gray, for: .normal)
            
            }).disposed(by: bag)

        todoItem = TodoItem()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        detailView.frame = CGRect(x: 0, y: 150, width: UIScreen.main.bounds.size.width, height: 200)
    }
    
    @objc func cancel() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func add() {
    
        guard let v = detailView, let f = v.taskTextField, let t = f.text else {
            todoItem.name = "loveway nil"
            return
        }
        todoItem.name = t
        todoItem.isFinished = detailView.statusSwitch.isOn
        todoSubject.onNext(todoItem)
        todoSubject.onCompleted()
        dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
