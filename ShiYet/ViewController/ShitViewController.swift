//
//  ShitViewController.swift
//  ShiYet
//
//  Created by 江昊 on 9/23/23.
//

import Foundation

import UIKit

class ShitViewController: UIViewController {
    
    var timer: Timer?
    var startTime: Date?
    var isShitting = false


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func StartShitting(_ sender: Any) {
        print("test")
        if isShitting {
                // End shitting
                endShitting()
            (sender as AnyObject).setTitle("Start Shitting", for: .normal)
            } else {
                // Start shitting
                startShitting()
                (sender as AnyObject).setTitle("End Shitting", for: .normal)
            }
    }
    
    @IBOutlet weak var elapsedTimeLabel: UILabel!
    
    func startShitting() {
        // Record the start time
        startTime = Date()
        
        // Start the timer
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        // Show the elapsed time label
        elapsedTimeLabel.isHidden = false
        
        // Set the shitting flag
        isShitting = true
    }

    func endShitting() {
        // Stop the timer
        timer?.invalidate()
        timer = nil
        
        // Hide the elapsed time label
        elapsedTimeLabel.isHidden = true
        
        // Calculate the elapsed time
        if let startTime = startTime {
            let endTime = Date()
            let elapsedTime = endTime.timeIntervalSince(startTime)
            
            // You can store the elapsed time or use it as needed
            print("Elapsed Time: \(elapsedTime) seconds")
        }
        
        // Change the button text

        // Reset the shitting flag
        isShitting = false
    }

    
    @objc func updateTimer() {
        if let startTime = startTime {
            let endTime = Date()
            let elapsedTime = endTime.timeIntervalSince(startTime)
            
            // Update the elapsed time label with the formatted time
            elapsedTimeLabel.text = formattedTime(time: elapsedTime)
        }
    }
    
    func formattedTime(time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }


}

