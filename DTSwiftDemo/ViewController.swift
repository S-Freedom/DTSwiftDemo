//
//  ViewController.swift
//  first_swift_demo
//
//  Created by liuyuting on 16/10/10.
//  Copyright © 2016年 pf. All rights reserved.
//


import UIKit
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    let cellId : String = "cellId"
    var arr  = [NSString]()

    var _headView :UIView = UIView()
    var headView: UIView {
        get {
            _headView = UIView()
            _headView.backgroundColor = UIColor.gray
            return _headView
        }
        set {
            _headView = newValue
        }
    }
    
    
    var _tableView:UITableView = UITableView()
    var tableView: UITableView {
        get {
            _tableView.tableHeaderView = _headView
            _tableView.separatorStyle = .none
            _tableView.delegate = self
            _tableView.dataSource = self
            return _tableView
        }
        set {
            _tableView = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let w : CGFloat! = view.bounds.width
        let h : CGFloat! = view.bounds.height
        arr = ["ONE","TWO","THREE","FOUR","FIVE",
               "SIX","SEVEN","EIGHT","NINE","TEN"]
        self.tableView.frame = CGRect(x: 0, y: 0, width:w, height:h)
        self.tableView.backgroundColor = UIColor.lightGray
        self.tableView .register(LSCustomCell.classForCoder(), forCellReuseIdentifier: cellId)
        
        view.addSubview(self.tableView)
        
        print("以下是测试数据")
        let obj = ClosureObj()
        let ten = obj.increment(amount: 10)
        let one = obj.increment(amount: 1)
        print("add ten \(ten())")
        print("add one \(one())")
        print("add ten \(ten())")
        print("add one \(ten())")
        print("add ten \(ten())")
        print("add one \(one())")
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell : LSCustomCell? = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? LSCustomCell
        if cell == nil {
            cell = LSCustomCell(style: .default, reuseIdentifier: cellId)
        }
        if ((indexPath.row % 2) == 0){
            cell!.backgroundColor = UIColor.lightGray
        }else{
            
            cell!.backgroundColor = UIColor.blue
        }
//       cell!.textLabel!.text = (arr[indexPath.row]) as String
        cell!.person = Person(name: "jaca", age: 10, className: "class-One")
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view : UIView = UIView(frame:CGRect(x: 0, y: 0, width: width, height: 50))
        let label : UILabel = UILabel(frame:CGRect(x: 0, y: 0, width: width, height: 50))
        label.textAlignment = .center
        view.addSubview(label)
        
        if section == 0 {
            label.backgroundColor = UIColor.gray
            label.text = "第一组头"
        }else{
            label.backgroundColor = UIColor.green
            label.text = "第二组头"
        }
        return view
    }
    
    
}

