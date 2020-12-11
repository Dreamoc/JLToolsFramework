//
//  JLRecorderButton.swift
//  JLToolsFramework
//
//  Created by Dreamoc on 2020/12/11.
//

import UIKit

class JLRecorderButton: UIButton,JLRecorderToolDelegate {

    let recorderTool = JLRecorderTool.init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setTitle("按下录音", for: UIControl.State.normal)
        self.setTitleColor(UIColor.black, for: UIControl.State.normal)
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        self.addTarget(self, action: #selector(recordBtnDidTouchDown), for: UIControl.Event.touchDown)
        self.addTarget(self, action: #selector(recordBtnDidTouchDragEnter), for: UIControl.Event.touchDragEnter)
        self.addTarget(self, action: #selector(recordBtnDidTouchUpInside), for: UIControl.Event.touchUpInside)
        self.addTarget(self, action: #selector(recordBtnDidTouchDragExit), for: UIControl.Event.touchDragExit)
        self.addTarget(self, action: #selector(recordBtnDidTouchUpOutside), for: UIControl.Event.touchUpOutside)
        
        ckeckRecorderAutor { (success) in
            print("权限\(success)");
        }
    }
    
    @objc func recordBtnDidTouchDown() {
        print("按住")
        self.recorderTool.start()
        self.setTitle("松手完成录音", for: UIControl.State.normal)
    }
    
    @objc func recordBtnDidTouchUpInside() {
        print("松开")
        let currentTime = self.recorderTool.currentTime
        self.recorderTool.stop()
        if currentTime < self.recorderTool.minTime {
            print("说话时间太短")
            self.recorderTool.deleteFile()
            let alert =  UIAlertController.init(title: nil, message: "说话时间太短", preferredStyle: UIAlertController.Style.alert)
            let cancle = UIAlertAction.init(title: "确定", style: UIAlertAction.Style.cancel, handler: nil)
            alert.addAction(cancle)
            let window:UIWindow = UIApplication.shared.windows.last!
            let vc: UIViewController = window.rootViewController!
            alert.show(vc, sender: nil)
        }else {
            print("完成录音\(self.recorderTool.path)")
        }
        self.setTitle("按下录音", for: UIControl.State.normal)
    }
    
    @objc func recordBtnDidTouchDragExit() {
         print("按住并且移动到外面")
        self.recorderTool.stop()
        self.setTitle("松手取消录音", for: UIControl.State.normal)
    }
    
    @objc func recordBtnDidTouchUpOutside() {
        print("外面松手,取消录音")
        self.recorderTool.stop()
        self.recorderTool.deleteFile()
        self.setTitle("按下录音", for: UIControl.State.normal)
    }
    
    @objc func recordBtnDidTouchDragEnter()  {
        print("从外面拖进来")
        self.setTitle("已完成录音", for: UIControl.State.normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension JLRecorderButton {
    func recorderTimeChange(time: TimeInterval) {
        if time > self.recorderTool.maxTime {
            self.recorderTool.stop()
            self.setTitle("已到最大时长", for: UIControl.State.normal)
        }
    }
}
