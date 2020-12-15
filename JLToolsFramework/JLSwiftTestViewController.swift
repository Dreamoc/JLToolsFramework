//
//  JLSwiftTestViewController.swift
//  JLToolsFramework
//
//  Created by Dreamoc on 2020/12/15.
//

import UIKit
//enum
enum MyEnum {
    case A
    case B
    case C
    case D
}
enum MyEnum1 {
    case Name(String)
    case Mark(Int, Int)
    case Other(String, Int)
}

//block
typealias Block = (Int)->Void

class JLSwiftTestViewController: UIViewController {
    //闭包
    public var bi = {(name: String)->String in
        return name
    }
    
    var myBlock: Block?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        stringTest()
        arrayTest()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.myBlock?(100)
        /*外面使用
        acc.myBlock = {(value: Int) in
            print(value);
        }
        */
    }
    
    //MARK: 字符串
    func stringTest() {
        let a = Int(arc4random() % 100)
        let b = 90
        
        var stringA: String?
        var stringB = ""
        
        if stringA == nil {
            print("A")
        }else {
            print("B")
        }
        
        if stringB.isEmpty {
            print("A")
        }else {
            print("B")
        }
        
        stringA = "大家好"
        stringB = "你好"
        
        var stringC = "\(a)乘以\(b)等于\(a*b)"
        stringC += "你好"
        print(stringC)
        print(stringC.count)
        
        //分割
        let stringD = "A#B#C#D#O&L&"
        let char: CharacterSet = ["#","&"]
        let stringArray = stringD.components(separatedBy: char)
        print(stringArray)
        let stringD_Stirng = stringArray.joined(separator: "*")
        print(stringD_Stirng)
        
        let line = "BLANCHE:   I don't want realism. I want magic!"
        print(line.split(separator: " "))
        //prints "["BLANCHE:", "I", "don\'t", "want", "realism.", "I", "want", "magic!"]"

        print(line.split(separator: " ", maxSplits: 1))
        //prints "["BLANCHE:", "  I don\'t want realism. I want magic!"]"

        print(line.split(separator: " ", omittingEmptySubsequences: false))
        //[rints "["BLANCHE:", "", "", "I", "don\'t", "want", "realism.", "I", "want", "magic!"]"
                
        let s = "Swift"
        if let i = s.index(s.startIndex, offsetBy: 0, limitedBy: s.endIndex) {
             print(s[i])
        }
        print(s[s.index(s.startIndex, offsetBy: 0)])

        let oo = s[s.index(after: s.startIndex)]
         print(oo)
        
        //截取
        //头部截取
        let str = "abcdefghijklmn"
        let str1 = str.prefix(2)
        print(str1)//ab
        
        //尾部截取
        let str2 = str.suffix(3)
        print(str2)//lmn
        
        //range截取
        let index3 = str.index(str.startIndex, offsetBy: 2)
        let index4 = str.index(str.startIndex, offsetBy: 5)
        let str5 = str[index3...index4]
        print(str5)
        
        //指定位置
        if let range = str.range(of: "fg") {
            print(str[str.startIndex..<range.lowerBound])//abcde
            print(str[str.startIndex..<range.upperBound])//abcdefg
        }
        
        //字符串替换
        let str6 = str.replacingOccurrences(of: "fg", with: "AAAAA")
        print(str6)
        
        //插入
        var strInsert = str
        strInsert.insert(contentsOf: "XXX", at: str.index(str.startIndex, offsetBy: 3))
        print(strInsert)
        
        //删除
        strInsert.remove(at: str.startIndex)
        strInsert.remove(at: strInsert.index(strInsert.startIndex, offsetBy: 3))
        print(strInsert)
        
        let start = strInsert.index(strInsert.startIndex, offsetBy: 3)
        let end = strInsert.index(strInsert.startIndex, offsetBy: 5)
        strInsert.removeSubrange(start...end)
        print(strInsert)
        
        let strC: Character = "P"
        strInsert.append(strC)
        print(strInsert)
        print(strInsert.uppercased())
        print(strInsert.lowercased())
        
    }
//    MARK:数组
    func arrayTest() {
        let arr: [Int] = [0,2,3]
        print(arr)
        
        let arr1: [String: Int] = ["A":1]
        print(arr1)
        
        let arr2: [Any] = [1,2,"a",2.5]
        print(arr2)
        
        //重复数据快速创建
        let arr3 = [String](repeating: "ABC", count: 10);
        print(arr3)
        
        //空数组
        let arr4 = [Int]()
        print(arr4)
        let arr4_1: Array<Int> = []
        print(arr4_1)
        let arr4_2: [Int] = []
        print(arr4_2)
        
        //遍历
        let arr5: [Any] = ["a",1,2,4,5,"ad"]
        for (key, value) in arr5.enumerated() {
            print("key\(key),index\(value)")
        }
        
        for value in arr5 {
            print(value)
        }
        
        //map
        let cast = ["abc","def","hig","klm","nop","qrs",]
        let lowerName = cast.map { $0.lowercased()}
        print(lowerName)
        
        //创建二维数组  $0 循环遍历index的value
        let flat = cast.map{Array.init(repeating: $0, count: $0.count)}
        print(flat)
        
        //返回一个序列
        let result = [[1,2,3],[4,5,6],[7,8,9]]
        let all = result.flatMap{$0}
        print(all)
        //大于5的序列
        let all1 = result.flatMap { $0.filter{$0>5}}
        print(all1)
        
        //可选类型序列化
        let result2: [String?] = ["AS","asd",nil,nil]
        let all2 = result2.compactMap({$0})
        print(all2)
        
        //强转
        let result3: [String] = ["123","123"]
        let all3 = result3.compactMap{Int($0)}
        print(all3)
        
        //遍历num初始值为10
        let result4 = [10,12,13,14]
        let numbers = result4.reduce(10) { (num, value) in
            num+value
        }
        print(numbers)
        
        //排序
        var result5 = result4
        result5.sort(by: >)
        print(result5)
        
        let stu = result5.filter { (value) -> Bool in
            return value > 2
        }
        print(stu)
        
        //数组拼接
        result5.append(contentsOf: stride(from: 2, through: 5, by: 2))
        print(result5)
        
        //包含
        print(result5.contains(10))
        
        //数量
        print(result5.count)
        //容量
        print(result5.capacity)
        
        //闭包
        print(bi("asd"))
        
        //排序
        let numbers0: [Int] = [5,2,3,1,4]
        var numbers1 = numbers0.sorted { (value1, value2) -> Bool in
            return value1 > value2
        }
        print(numbers1)
        
        //自动内联函数
        var numbers2 = numbers0.sorted(by: {$0>$1})
        print(numbers2)
        
        //运算符函数
        var numbers3 = numbers0.sorted(by: >)
        print(numbers3)
        
        //尾随闭包
        var numbers4 = numbers0.sorted(){$0>$1}
        print(numbers4)
        
        
        //闭包 捕获值
        func oneFunc(forIncrement amount: Int)->()->Int {
            var run = 10
            func inc()->Int {
                run += amount
                return run
            }
            return inc
        }
        
        let fff = oneFunc(forIncrement: 100)
        print(fff)
        print(fff())
        print(fff())
        
        //枚举
        var myEnum: MyEnum =  MyEnum.A
        myEnum = .A
        switch myEnum {
        case .A:
            print("A")
        case .B:
            print("B")
        case .C:
            print("C")
        case .D:
            print("D")
        default:
            print("S")
        }
        
        var myEnum1: MyEnum1 = MyEnum1.Name("abc")
        myEnum1 = .Other("哈哈", 100)
        switch myEnum1 {
        case .Name(let name):
            print(name)
        case .Mark(let value1, let value2):
            print(value1 + value2)
        case .Other(let name, let value):
            print("\(name)\(value)")
        default:
            print("S")
        }
    }
}
