//
//  ViewController.swift
//  AppStoreComment
//
//  Created by Feng on 2017/4/19.
//  Copyright © 2017年 Feng. All rights reserved.
//

import UIKit
import StoreKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let button = UIButton(type: .custom)
        button.addTarget(self, action: #selector(pushAppStoreComment), for: .touchUpInside)
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        button.setTitle("评论", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        view.addSubview(button)
        
        let button1 = UIButton(type: .custom)
        button1.addTarget(self, action: #selector(alternateIcon), for: .touchUpInside)
        button1.frame = CGRect(x: 100, y: 200, width: 100, height: 50)
        button1.setTitle("更换icon", for: .normal)
        button1.setTitleColor(UIColor.black, for: .normal)
        view.addSubview(button1)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        pushAppStoreComment()
    }

    func pushAppStoreComment() {
        
        SKStoreReviewController.requestReview()
    }
    
    func alternateIcon() {
        if UIApplication.shared.supportsAlternateIcons {
            print("you can change this app's icon")
        }else {
            print("you cannot change this app's icon")
            return
        }
        
        if let name = UIApplication.shared.alternateIconName {
            // CHANGE TO PRIMARY ICON
            UIApplication.shared.setAlternateIconName(nil) { (err:Error?) in
                print("set icon error：\(String(describing: err))")
            }
            print("the alternate icon's name is \(name)")
        }else {
            // CHANGE TO ALTERNATE ICON
            UIApplication.shared.setAlternateIconName("blackBgColor") { (err:Error?) in
                print("set icon error：\(String(describing: err))")
            }
        }
    }
}

