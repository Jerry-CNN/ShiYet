import Foundation
import UIKit

class  ShitViewController: UIViewController{
    
    var timer: Timer?
    var startTime: Date?
    var isShitting = false
    let dm = DatabaseManager.shared


    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func StartShitting(_ sender: Any) {
        if isShitting {
            print("End Shitting")
                // End shitting
                endShitting()
            (sender as AnyObject).setTitle("Start Shitting", for: .normal)
            } else {
                dm.createTable()
                dm.deleteAll() // Need to delete
                print("Start Shitting")
                // Start shitting
                startShitting()
                (sender as AnyObject).setTitle("End Shitting", for: .normal)
            }
    }
    
    @IBOutlet weak var elapsedTimeLabel: UILabel!
    
    func startShitting() {
        
        elapsedTimeLabel.text = formattedTime(time: 00)
        // Record the start time
        startTime = Date()
        
        // Start the timer
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        // Show the elapsed time label
        elapsedTimeLabel.isHidden = false
        
        // Set the shitting flag
        isShitting = true
        
        // Create a new entry in shit record
        dm.insertShit(start_time: startTime!)
        dm.getAllShit()
        
    }

    func endShitting() {
        // Stop the timer
        timer?.invalidate()
        timer = nil

        // Calculate the elapsed time
        if let startTime = startTime {
            let endTime = Date()
            let elapsedTime = endTime.timeIntervalSince(startTime)
            
            // Update end time of existing entry
            dm.updateEndTime(start_time: startTime, new_end_time: endTime)
            dm.getAllShit()

            // You can store the elapsed time or use it as needed
            print("Elapsed Time: \(elapsedTime) seconds")
        }

        // Create an instance of FeedbackViewController
        let feedbackVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FeedbackViewController") as! FeedbackViewController

        // Present the FeedbackViewController
        self.present(feedbackVC, animated: true, completion: nil)

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
