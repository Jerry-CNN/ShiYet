import UIKit

class ReportViewController: UIViewController {

    let contentView = UIView()

    @IBOutlet weak var ReportSection: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()

        // Add content to contentView (this can be any subviews you want)
        let contentLabel = UILabel()
        contentLabel.text = "Your vertically scrollable content goes here. nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnYou can add more labels, images, or other views as needed.Your vertically scrollable content goes here. nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnYou can add more labels, images, or other views as needed.Your vertically scrollable content goes here. nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnYou can add more labels, images, or other views as needed.Your vertically scrollable content goes here. nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnYou can add more labels, images, or other views as needed.Your vertically scrollable content goes here. nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnYou can add more labels, images, or other views as needed.Your vertically scrollable content goes here. nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnYou can add more labels, images, or other views as needed.Your vertically scrollable content goes here. nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnYou can add more labels, images, or other views as needed.Your vertically scrollable content goes here. nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnYou can add more labels, images, or other views as needed.Your vertically scrollable content goes here. nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnYou can add more labels, images, or other views as needed.Your vertically scrollable content goes here. nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnYou can add more labels, images, or other views as needed.Your vertically scrollable content goes here. nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnYou can add more labels, images, or other views as needed."
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
