//
//  ViewController.swift
//  ShiYet
//
//  Created by 蔡延校 on 9/23/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func test(_ sender: UIButton) {
        print("Button tapped") // This message will appear in the Xcode console.
        view.backgroundColor = .black
    }
    @IBAction func test2(_ sender: Any) {
        print("Button tapped") // This message will appear in the Xcode console.
        view.backgroundColor = .black
    }
}

