//
//  LSCustomCell.swift
//  first_swift_demo
//
//  Created by liuyuting on 16/11/24.
//  Copyright © 2016年 pf. All rights reserved.
//

import UIKit

class LSCustomCell: UITableViewCell {

    var _person : Person? = Person()
    var person : Person{
        get{
            return _person!
        }
        set{
            _person = newValue
            
            _nameLabel.text = _person!.name as String
            _titLabel.text = String(describing: _person!.age)
        }
    }
    
    var _nameLabel : UILabel = UILabel()
    var nameLabel : UILabel{
        get{
            return _nameLabel
        }
        set{
            _nameLabel = newValue
        }
    }
    
    var _titLabel : UILabel = UILabel()
    var titLabel : UILabel {
        get{
            return _titLabel
        }
        set{
            _titLabel = newValue
        }
    }
    
  override  init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    
    super.init(style: .default, reuseIdentifier: reuseIdentifier)
    
    let nameLabel : UILabel? = UILabel(frame: CGRect(x: 15, y: 10, width: 40, height: 20))
    nameLabel?.text = "test"
    nameLabel?.font = UIFont.systemFont(ofSize: 14.0)
    nameLabel?.textAlignment = .center
    _nameLabel = nameLabel!
    self.contentView.addSubview(nameLabel!)
    
    let width : CGFloat = UIScreen.main.bounds.size.width
    
    
    let titLabel : UILabel? = UILabel(frame:CGRect(x: 0, y: 0, width: 40, height: 20))
    titLabel?.center = self.contentView.center
    titLabel?.text = "text"
    titLabel?.font = UIFont.systemFont(ofSize: 14.0)
    titLabel?.textAlignment = .center
    _titLabel = titLabel!
    self.contentView.addSubview(titLabel!)
    
    let btnW : CGFloat = 80;
    let btn : UIButton = UIButton(frame:CGRect(x: (width - btnW - 15), y: 10, width: 80, height: 20))
    btn.titleLabel?.font = UIFont.systemFont(ofSize: 14.0)
    btn.setTitleColor(UIColor.red, for: .normal)
    btn.setTitle("click me", for: .normal)
    btn.addTarget(self, action:#selector(btnClick(btn:)), for: .touchUpInside)
    self.contentView.addSubview(btn)
}

    func btnClick(btn : UIButton) -> Void {
        print("\(btn)")
    }
    
    
  required  init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
