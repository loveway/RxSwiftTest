//
//  TodoItem.swift
//  RxSwiftTest
//
//  Created by HenryCheng on 2019/12/3.
//  Copyright © 2019 igancao. All rights reserved.
//

import Foundation

//要想归结档必须实现 NSCoding 协议
class TodoItem: NSObject, NSCoding {
    
    var name: String = ""
    var isFinished: Bool = false
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "Name")
        coder.encode(isFinished, forKey: "isFinished")
    }
    
    required init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: "Name") as! String
        isFinished = coder.decodeBool(forKey: "isFinished")
        super.init()
    }
    
    override init() {
        super.init()
    }
    
    init(name: String, isFinished: Bool) {
        self.name = name
        self.isFinished = isFinished
    }
    
    func toggleFinished() {
        isFinished = !isFinished
    }

}
