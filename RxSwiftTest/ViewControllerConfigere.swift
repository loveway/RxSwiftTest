//
//  ViewControllerConfigere.swift
//  RxSwiftTest
//
//  Created by HenryCheng on 2019/12/3.
//  Copyright © 2019 igancao. All rights reserved.
//

import UIKit


extension ViewController {
    
    func configureStatus(for cell: TodoCell, with item: TodoItem) {
        let label = cell.iconLabel!
        if item.isFinished {
            label.text = "✓"
        }
        else {
            label.text = ""
        }
    }
    
    func configureLabel(for cell: TodoCell, with item: TodoItem) {
        
        cell.contentLabel.text = item.name
    }
}
