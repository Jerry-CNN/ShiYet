import UIKit
import Charts
import SwiftUI


struct ToyShape: Identifiable {
    var id = UUID()
    var type: String
    var count: Double
}

var data: [ToyShape] = [
    .init(type: "Cube", count: 5),
    .init(type: "Sphere", count: 4),
    .init(type: "Pyramid", count: 4)
]

struct ChartView: View {
    var body: some View {
        if #available(iOS 16.0, *) {
            Chart {
                ForEach(data) { shape in
                    BarMark(
                        x: .value("Shape Type", shape.type),
                        y: .value("Total Count", shape.count)
                    )
                }
            }
        } else {
            // Fallback on earlier versions
        }
    }
}


class HisStatViewController: UIViewController {

    @IBOutlet weak var ReportSection: UIScrollView!
    let contentView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Call the setupScrollView function to set up the scrollView
        setupScrollView()

        // Create an instance of ChartView and embed it using UIHostingController
        let chartViewController = UIHostingController(rootView: ChartView())
        
        // Add the UIHostingController's view as a subview to contentView
        addChild(chartViewController)
        contentView.addSubview(chartViewController.view)
        chartViewController.didMove(toParent: self)

        // Add constraints for the chartViewController's view within contentView
        chartViewController.view.translatesAutoresizingMaskIntoConstraints = false
        chartViewController.view.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        chartViewController.view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        chartViewController.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        chartViewController.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        chartViewController.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
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
