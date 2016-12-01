//
//  Person.swift
//  first_swift_demo
//
//  Created by liuyuting on 16/11/1.
//  Copyright © 2016年 pf. All rights reserved.
//

import UIKit

class Person: NSObject {
    
    private var _name:NSString?
    public var name:NSString {
        get {
            return _name!
        }
        set {
            _name = newValue
        }
    }
    private var _age:Int = 0
   public var age:Int {
        get {
            return _age
        }
        set {
            _age = newValue
        }
    }
    private var _className : NSString = ""
   public var className:NSString {
        get {
            return _className
        }
        set {
            _className = newValue
        }
    }
    
    override init() {
        super.init()
    }
    
   init(name:NSString,age:Int,className:NSString) {
        super.init()
        self.name = name
        self.age = age
        self.className = className
        print("姓名:\(name)年龄:\(age)班级:\(className)")
    }
    
    func describe(){
        print("姓名:\(self.name)年龄:\(self.age)班级:\(self.className)")
    }
    
}
