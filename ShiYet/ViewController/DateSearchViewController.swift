//
//  HisStatViewController.swift
//  ShiYet
//
//  Created by 江昊 on 9/23/23.
//

import Foundation
import SQLite
import UIKit

class DateSearchViewController: UIViewController {
    static func makeDateSearchVC(current_time: Date) -> DateSearchViewController {
    let newViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DateSearchViewController") as! DateSearchViewController
    
    newViewController.current_time = current_time
    
    return newViewController
    }
    var current_time: Date? = nil
    let contentView = UIView()
    let dm = DatabaseManager.shared
    
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
        
        let contentLabel = UILabel()
        let db: Connection = dm.getDb()
        let reports = dm.getDateRecord(startdate: current_time!)
        print(reports)
        var output:String = ""
        do{
            for record in try db.prepare(reports) {
                do {
                    output += """
                        Start Date: \(try record.get(start_time)),
                        End Date: \(try record.get(end_time)),
                        Shape: \(try record.get(shape)),
                        Color: \(try record.get(color)),
                        Sticky: \(try record.get(sticky)),
                        Blood: \(try record.get(blood)),
                        Amount: \(try record.get(amount)),
                        Feeling: \(try record.get(feeling))
                        ----------------------------------------
                        """
                    print(output)
                    contentLabel.text = output
                    contentLabel.numberOfLines = 0 // Allow multiple lines of text
                    contentView.addSubview(contentLabel)
                    
                    contentLabel.translatesAutoresizingMaskIntoConstraints = false
                    contentLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
                    contentLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
                    contentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
                    contentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
                    contentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
                    contentLabel.baselineAdjustment = .alignCenters
                    
                    contentLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
                } catch {
                    print("123131")
                    print("Error entries: \(error)")
                }
            }
        } catch {
            print("Error entries: \(error)")
        }
        print("Date Search Results"+output)
        
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
