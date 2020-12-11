//
//  JLRecorderTool.swift
//  JLToolsFramework
//
//  Created by Dreamoc on 2020/12/11.
//

import UIKit
import AVFoundation

protocol JLRecorderToolDelegate: NSObjectProtocol {
    func recorderTimeChange(time:TimeInterval)
}

class JLRecorderTool: NSObject,AVAudioRecorderDelegate {
    
    //缓存路径
    let path: String = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first!.appending("/tmp.aac")
    
    //配置
    let setting = getSetting()
    
    //当前录音时长
    var currentTime : TimeInterval = 0
    
    //硬件资源（麦克风 扬声器）管理
    var session: AVAudioSession?
    
    //录音机
    var recorder: AVAudioRecorder?
    
    weak open var delegate: JLRecorderToolDelegate?
    
    //计时器
    var timer: Timer?
    
    var minTime : TimeInterval = 2
    var maxTime : TimeInterval = 10
    
    //音波图
    var recorderImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 64, height: 64))
    
    override init() {
        super.init();
        do {
            self.recorder = try AVAudioRecorder.init(url: URL.init(string: path)!, settings: setting);
            self.recorder!.isMeteringEnabled = true
            self.recorder!.delegate = self
            self.recorder!.prepareToRecord()
            print(path);
        } catch {
            print("create recorder error:")
        }
    }
    
    @objc func upload() {
        self.recorder?.updateMeters()
        let a:Float = (self.recorder?.peakPower(forChannel: 0))!
        let b = 0.05 * a
        let lowPass = pow(10, b)
        let result:Float = 10.0 * lowPass
        var no: Int = 0;
        if result > 0 && result <= 1.3 {
            no = 1
        }else if result > 1.3 && result <= 2 {
            no = 2
        }else if result > 2 && result <= 3 {
            no = 3
        }else if result > 3 && result <= 5 {
            no = 4
        }else if result > 5 && result <= 10 {
            no = 5
        }else if result > 10 && result <= 40 {
            no = 6
        }else if result > 40 {
            no = 7
        }
        
        self.currentTime = self.recorder?.currentTime ?? 0
        print("时间\(self.currentTime)")
        
        self.delegate?.recorderTimeChange(time: self.currentTime)
        
        self.recorderImageView.image = UIImage.init(named: "mic_\(no)")
    }
    
    //开始录音
    func start() {
        self.currentTime = 0
        self.stop()
        let session = AVAudioSession.sharedInstance()
        
        do {
            try session.setCategory(AVAudioSession.Category.record)
        } catch {
            print("create session error")
        }
        
        do {
            try self.session?.setActive(true, options: AVAudioSession.SetActiveOptions.init())
        } catch  {
            print("session setActive error")
        }
        
        self.session = session
        
        self.recorder?.record()
        
        self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(upload), userInfo: nil, repeats: true)
        RunLoop.main.add(self.timer!, forMode: RunLoop.Mode.common)
        self.timer?.fireDate = NSDate.distantPast
        
        let window:UIWindow = UIApplication.shared.windows.last!
        window.addSubview(self.recorderImageView)
        self.recorderImageView.center = CGPoint.init(x: window.bounds.size.width / 2, y: window.bounds.size.height / 2 )
    }
    
    //停止
    func stop() {
        self.recorder?.stop()
        self.timer?.invalidate()
        self.timer = nil;
        self.recorderImageView.removeFromSuperview()
    }
    
    func deleteFile() {
        self.currentTime = 0
        do {
            try FileManager.default.removeItem(atPath: self.path)
        } catch  {
            print("delete file error")
        }
    }
}

//MARK: 录音机代理
extension JLRecorderTool {
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag == true {
            do {
                try self.session?.setActive(false, options: AVAudioSession.SetActiveOptions.init())
            } catch  {
                print("session setActive error")
            }
        }else {
            stop()
        }
    }
    
    func audioRecorderEncodeErrorDidOccur(_ recorder: AVAudioRecorder, error: Error?) {
        print(error.debugDescription)
    }
}

//MARK: 设置录音机属性
func getSetting() -> [String:Any] {
    return [
        AVSampleRateKey: NSNumber.init(value: 44100),
        AVFormatIDKey: NSNumber.init(value:kAudioFormatMPEG4AAC),
        AVNumberOfChannelsKey:NSNumber.init(value: 2),
        AVEncoderAudioQualityKey:NSNumber.init(value: AVAudioQuality.high.rawValue),
        AVEncoderBitRateKey:NSNumber.init(value: 128000),
    ]
}

func ckeckRecorderAutor(block: @escaping (Bool)->Void) -> Void {
    let authstatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.audio)
    switch authstatus {
    case AVAuthorizationStatus.notDetermined:
        AVCaptureDevice.requestAccess(for: AVMediaType.audio, completionHandler: block)
        break
    case AVAuthorizationStatus.restricted:
        block(false)
        break
    case AVAuthorizationStatus.denied:
        block(false)
        break
    case AVAuthorizationStatus.authorized:
        block(true)
        break
    default:
        block(false)
    }
}
