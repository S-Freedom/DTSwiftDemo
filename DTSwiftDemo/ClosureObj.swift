//
//  ClosureObj.swift
//  first_swift_demo
//
//  Created by liuyuting on 16/12/1.
//  Copyright © 2016年 pf. All rights reserved.
//

import UIKit

class ClosureObj: NSObject {

    // 直接赋值属性，看看和闭包有何区别，看不出来吗，那就往下看吧
    var str : String = "jack"
    
    // 闭包可以这么定义
    var str0 : String = {
       return "jack"
    }()
    
    // 可以省略 = 和 ()
    var str1 : String{
        return "jack"
    }
    
    // 可以包含get方法
    var str2 : String {
        get{
            return "jack"
        }
    }
    
    // 当然也可以包含 set 方法
    var str3 : String {
        get{
            return "jack"
        }
        
        set{
            print("jack")
        }
    }
    
    // 那willSet 和 willGet 也可以咯
    var str4 : String = "Bob" {
        willSet{
            print("Bob")
        }
        
        didSet{
            print("Bob")
        }
    }

    
    // 闭包定义
    //    {
    //
    //        (arguments) - > returnType in
    //        code
    //    }(arguments)
    // 可以在闭包中定义参数，返回值。闭包后用括号执行，并在括号中可以传参， 例如
    var s = {
        (arg1:String,arg2:String) -> String in
        return arg1 + arg2
    }("Job1","Bob2")
    
 
    // 基于上面最全的定义方式，我们可以省略参数类型：
    var s2 = {
        
        arg1,arg2 -> String in
        return arg1 + arg2
        
    }("Job1","Bob2")
    
    // swift 的类型推到，根据后面括号的传参能自动判断参数的类型
    // 那么我们是不是也可以省略 返回值类型，但是在声明时要确定
    // eg:
    var s3 : String = {
        arg1,arg2 in
        return arg1 + arg2
    }("Job1","Bob2")
    
    
    // 是不是很爽，其实还可以更爽
    var s4 : String = {
        return $0 + $1
    }("Job1","Bob2")
    // 这样写return 是不是感觉没有作用,那就这样好了
    
    var s5 : String = {
        $0 + $1
    }("Job1","Bob2")
    
    // 如果闭包没有参数呢，那还不简单
    var s6 : String = {
        return "Job"
    }()
    
    // 什么，你说括号也没用，那干脆点好了
    // tip: 没有（） 也不需要 = 了
    var s7 : String {
        return "JOB"
    }
    // 回头再看看上面声明的str 变量，是不是耳目一新了
    
    func test() {
        let arr = [20,35]
        let a = arr.map { (number) -> String in
            var output = ""
            while number > 0 {
                output = String(number % 10) + output
//                number /=  10
            }
            return output
        }
    }
    
    func increment(amount : Int) -> (() -> Int){
        
        var total = 0
        func incrementAmount() -> Int {
             total += amount
            return total
        }
        return incrementAmount
        
    }
    
//    逃逸闭包
//    @escaping
//    
//    传递给函数的闭包如果不是在函数内调用，而是在函数内用外部变量保存当前的闭包，在合适的时间再进行调用，这是就需要在闭包参数前加入 @escaping 关键字，不然编译器会报错。
//    
//    比较好理解的就是经常用到的网络请求，请求完成才执行完成的闭包。
//    
//    官方的例子如下：
    var escapClosures : [() -> String] = []
    
    func escap(escapClosure: @escaping () -> String){
        escapClosures.append(escapClosure)
    }
    
//    @autoclosure  自动闭包
    
    // 如果不用autoClosure
    var customers = ["ALex","EWa","job","jack"]
    func serve(customer customerCloser : () -> String){
        print("Now serving is \(customerCloser())")
    }
    
    func d () {
        serve(customer: {customers.remove(at: 0)})
    }
    
}
