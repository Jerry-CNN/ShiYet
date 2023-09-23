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
        }
    }

    // Insert a new user into the database.
    func insertShit(start_time: Date) {
        do {
            let insert = shit_record.insert(self.start_time <- start_time)
            try db.run(insert)
            print("Single shit record inserted successfully.")
        } catch {
            print("Error inserting shit record: \(error)")
        }
    }

    // Query all users from the database.
//    func getAllShit() -> [String] {
//        var userList: [String] = []
//
//        do {
//            for user in try db.prepare(shit_record) {
//                userList.append(user[username])
//            }
//        } catch {
//            print("Error querying users: \(error)")
//        }
//
//        return userList
//    }

    // Update a user's username by ID.
    func updateUser(start_time: Date, new_end_time: Date, new_shape: String, new_color: String, new_smell: String, new_sticky: Bool, new_blood: Bool, new_amount: String, new_feeling: String) {
        let userToUpdate = shit_record.filter(self.start_time == start_time)
        do {
            let update = userToUpdate.update(end_time <- new_end_time, shape <- new_shape, smell <- new_smell, sticky <- new_sticky, color <- new_color, blood <- new_blood, amount <- new_amount, feeling <- new_feeling)
            try db.run(update)
            print("Single shit record updated successfully.")
        } catch {
            print("Error updating shit record: \(error)")
        }
    }

    // Delete a user by ID.
//    func deleteUser(id: Int) {
//        let userToDelete = shit_record.filter(self.id == id)
//
//        do {
//            try db.run(userToDelete.delete())
//            print("User deleted successfully.")
//        } catch {
//            print("Error deleting user: \(error)")
//        }
//    }

    // Close the database connection when done.
//    func closeDatabase() {
//        db.close()
//    }
}
