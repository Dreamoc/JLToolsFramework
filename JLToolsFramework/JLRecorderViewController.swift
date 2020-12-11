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
    }
    

    

}
