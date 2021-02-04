//
//  JLModelViewController.swift
//  JLToolsFramework
//
//  Created by 冯金林 on 2021/2/4.
//

import UIKit

class JLModelViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //json字符串,基础类型一定要一致
        let JSONString = "{\"name1\":\"xiaoming\",\"age\":10, \"state\": 2}"
        guard let jsonData = JSONString.data(using: .utf8) else {
                return
        }
        let decoder = JSONDecoder()
        guard let obj = try? decoder.decode(Person.self, from: jsonData) else {
                return
        }
        self.title = obj.name
        print(obj.name) //xiaoming
        print(obj.age)  //10
        // Do any additional setup after loading the view.
    }
    

    

}


enum State:Int, Codable {
    case none = 1
    case add = 2
    case dele = 3
}

class Person: Codable {
    var name : String?
    var age : Int?
    var state: State?
}
