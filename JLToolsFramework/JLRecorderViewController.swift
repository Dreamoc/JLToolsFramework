//
//  JLRecorderViewController.swift
//  JLToolsFramework
//
//  Created by Dreamoc on 2020/12/11.
//

import UIKit

class JLRecorderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let button = JLRecorderButton.init(frame: CGRect.init(x: 100, y: 100, width: 150, height: 150))
        button.backgroundColor = UIColor.blue
        self.view.addSubview(button)
        
        let a = Int(arc4random() % 100)
        let b = 13
        let c = a&b
        print(c);
                
        switch a {
        case 10:
            print("1")
        case 20:
            print("2")
            fallthrough//贯穿到下一个
        case 60:
            print("3")
        default:
            print("4")
        }
    
    }
}
