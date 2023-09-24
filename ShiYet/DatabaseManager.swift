//
//  DatabaseManager.swift
//  ShiYet
//
//  Created by Jiawen Wei on 9/23/23.
//

import Foundation
import SQLite

class DatabaseManager {
    static let shared = DatabaseManager()
    private let db: Connection


    private let shit_record = Table("shit_record")
    private let start_time = Expression<Date>("start_time")
    private let end_time = Expression<Date>("end_time")
    private let shape = Expression<String>("shape")
    private let color = Expression<String>("color")
    private let smell = Expression<String>("smell")
    private let sticky = Expression<Bool>("sticky")
    private let blood = Expression<Bool>("blood")
    private let amount = Expression<String>("amount")
    private let feeling = Expression<String>("feeling")

    private init() {
        // Define the path to the SQLite database file.
        let dbPath = try! FileManager.default.url(
            for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: false
        ).appendingPathComponent("shitRecord.sqlite")

        // Open a connection to the database.
        db = try! Connection(dbPath.path)
    }

    // Create the "users" table if it doesn't exist.
    func createTable() {
        do {
            try db.run(shit_record.create { t in
                t.column(start_time, primaryKey: true)
                t.column(end_time)
                t.column(shape)
                t.column(color)
                t.column(smell)
                t.column(sticky)
                t.column(blood)
                t.column(amount)
                t.column(feeling)
            })
            print("Table created successfully.")
        } catch {
            print("Error creating table: \(error)")
            print("-------------------------------")
        }
    }

    // Insert a new user into the database.
    func insertShit(start_time: Date) {
        do {
            let insert = shit_record.insert(self.start_time <- start_time, self.end_time <- start_time, self.shape <- "", self.color <- "", self.smell <- "", self.sticky <- false, self.blood <- false, self.amount <- "", self.feeling <- "")
            try db.run(insert)
            print("Single shit record inserted successfully.")
        } catch {
            print("Error inserting shit record: \(error)")
        }
    }

//     Query all users from the database.
    func getAllShit() {

        do {
            for shit in try db.prepare(shit_record) {
                let output = """
                    Start Date: \(shit[start_time]),
                    End Date: \(shit[end_time]),
                    Shape: \(shit[shape]),
                    Color: \(shit[color]),
                    Sticky: \(shit[sticky]),
                    Blood: \(shit[blood]),
                    Amount: \(shit[amount]),
                    Feeling: \(shit[feeling])
                    ----------------------------------------
                    """
                print(output)
            }
        } catch {
            print("Error querying shit record: \(error)")
        }
    }

    // Update a shit record entirely with user's input.
    func updateRecord(start_time: Date,
                    new_shape: String,
                    new_color: String,
                    new_smell: String,
                    new_sticky: Bool,
                    new_blood: Bool,
                    new_amount: String,
                    new_feeling: String) {
        let userToUpdate = shit_record.filter(self.start_time == start_time)
        do {
            let update = userToUpdate.update(shape <- new_shape, smell <- new_smell, sticky <- new_sticky, color <- new_color, blood <- new_blood, amount <- new_amount, feeling <- new_feeling)
            try db.run(update)
            print("Single shit record updated successfully.")
        } catch {
            print("Error updating shit record: \(error)")
        }
    }
    
    // Update a user's username by ID.
    func updateEndTime(start_time: Date,
                    new_end_time: Date) {
        let userToUpdate = shit_record.filter(self.start_time == start_time)
        do {
            let update = userToUpdate.update(end_time <- new_end_time)
            try db.run(update)
            print("Single shit end time updated successfully.")
        } catch {
            print("Error updating shit record: \(error)")
        }
    }

    //  Delete all shit records.
    func deleteAll() {
        do {
            let deleteAll = shit_record.delete()
            try db.run(deleteAll)
            print("All entries deleted successfully.")
        } catch {
            print("Error deleting entries: \(error)")
        }
    }
    
    func getRecord(start_time: Date) -> Table {
        let userToUpdate = shit_record.filter(self.start_time == start_time)
        return userToUpdate
    }

}
