import Foundation

import UIKit

class FeedbackViewController: UIViewController {
    
    var submitted = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func submit(_ sender: Any) {
        if !submitted {
            let reportVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ReportViewController") as! ReportViewController

            // Present the FeedbackViewController
            self.present(reportVC, animated: true, completion: nil)
            submitted = true
            (sender as AnyObject).setTitle("Quit", for: .normal)
        }
        else {
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    

}
