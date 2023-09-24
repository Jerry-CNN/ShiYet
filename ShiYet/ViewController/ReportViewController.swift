import UIKit
import SQLite

class ReportViewController: UIViewController {
    
    static func makeReportVC(current_time: Date) -> ReportViewController {
    let newViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ReportViewController") as! ReportViewController
    
    // Primary key for data query
    newViewController.current_time = current_time
    
    return newViewController
    }
    
    var current_time: Date? = nil
    let contentView = UIView()
    let dm = DatabaseManager.shared
    let at = AnalysisText()
    
    private let start_time = Expression<Date>("start_time")
    private let end_time = Expression<Date>("end_time")
    private let shape = Expression<String>("shape")
    private let color = Expression<String>("color")
    private let smell = Expression<String>("smell")
    private let sticky = Expression<Bool>("sticky")
    private let blood = Expression<Bool>("blood")
    private let amount = Expression<String>("amount")
    private let feeling = Expression<String>("feeling")
    
    @IBOutlet weak var ReportSection: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()

        // Add content to contentView (this can be any subviews you want)
        let contentLabel = UILabel()
        let data = dm.getRow(start_time: current_time!)
        var output: String = ""
        
        // Generating analysis
        output.append(contentsOf: at.shape_advice[data[0] as! String]!)
        output.append(contentsOf: at.color_advice[data[1] as! String]!)
        output.append(contentsOf: at.amount_advice[data[2] as! String]!)
        output.append(contentsOf: at.feeling_advice[data[3] as! String]!)
        output.append(contentsOf: at.smell_advice[data[4] as! String]!)
        output.append(contentsOf: at.blood_advice[data[5] as! Bool]!)
        output.append(contentsOf: at.sticky_advice[data[6] as! Bool]!)
        output.append(contentsOf: at.time_advice[data[7] as! Int]!)

        contentLabel.text = output
        contentLabel.numberOfLines = 0 // Allow multiple lines of text
        contentView.addSubview(contentLabel)

        // Add constraints for the contentLabel within contentView
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        contentLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        contentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        contentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        contentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        contentLabel.baselineAdjustment = .alignCenters
        
        contentLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true

    }

    @IBAction func Back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    func setupScrollView() {
        // Add ReportSection (UIScrollView) to the view controller's view
        view.addSubview(ReportSection)

        // Add contentView to ReportSection (UIScrollView)
        ReportSection.addSubview(contentView)

        // Enable vertical scrolling
        ReportSection.isScrollEnabled = true

        // Set contentView's background color (just for illustration)
        contentView.backgroundColor = UIColor.systemBackground

        // Add constraints for contentView
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: ReportSection.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: ReportSection.leadingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: ReportSection.bottomAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: ReportSection.trailingAnchor).isActive = true

        // Set the width constraint to control horizontal scrolling
        contentView.widthAnchor.constraint(equalTo: ReportSection.widthAnchor).isActive = true

        // Add a height constraint to control vertical scrolling
        contentView.heightAnchor.constraint(greaterThanOrEqualTo: ReportSection.heightAnchor).isActive = true
    }
    
    
}
