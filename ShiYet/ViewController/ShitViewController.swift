//
//  ShitViewController.swift
//  ShiYet
//
//  Created by 江昊 on 9/23/23.
//

import Foundation

import UIKit

class ShitViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func test(_ sender: Any) {
        print("Button tapped") // This message will appear in the Xcode console.
        view.backgroundColor = .black
    }
    @IBAction func test2(_ sender: Any) {
        view.backgroundColor = .white
    }
    


}

