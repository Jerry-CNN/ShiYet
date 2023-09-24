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

    override func viewDidLoad() {
        super.viewDidLoad()
        let db: Connection = dm.getDb()
        let reports = dm.getDateRecord(startdate: current_time!)
        var output:String = ""
        do{
            for record in try db.prepare(reports) {
                do {
                    output = """
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
                } catch {
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
}
