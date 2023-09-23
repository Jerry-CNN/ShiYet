////
////  DatabaseManager.swift
////  ShiYet
////
////  Created by Jiawen Wei on 9/23/23.
////
//
//import Foundation
//import SQLite
//
//class DatabaseManager {
//    static let shared = DatabaseManager()
//    private let db: Connection
//
//    private let shit_record = Table("shit_record")
//    private let shit_id = Expression<Int>("shit_id")
//    private let start_time = Expression<String>("start_time")
//    private let time_elapse = Expression<String>("time_elapse")
//    private let end_time = Expression<String>("end_time")
//    private let shape = Expression<String>("shape")
//    private let color = Expression<String>("color")
//    private let smell = Expression<String>("smell")
//    private let sticky = Expression<String>("sticky")
//    private let blood = Expression<String>("blood")
//    private let amount = Expression<String>("amount")
//    private let feeling = Expression<String>("feeling")
//
//    private init() {
//        // Define the path to the SQLite database file.
//        let dbPath = try! FileManager.default.url(
//            for: .documentDirectory,
//            in: .userDomainMask,
//            appropriateFor: nil,
//            create: false
//        ).appendingPathComponent("myDatabase.sqlite")
//
//        // Open a connection to the database.
//        db = try! Connection(dbPath.path)
//    }
//
//    // Create the "users" table if it doesn't exist.
//    func createTable() {
//        do {
//            try db.run(shit_record.create { t in
//                t.column(shit_id, primaryKey: true)
//                t.column(start_time)
//                t.column(time_elapse)
//                t.column(end_time)
//                t.column(shape)
//                t.column(color)
//                t.column(smell)
//                t.column(sticky)
//                t.column(blood)
//                t.column(amount)
//                t.column(feeling)
//            })
//            print("Table created successfully.")
//        } catch {
//            print("Error creating table: \(error)")
//        }
//    }
//
////    // Insert a new user into the database.
////    func insertShit() {
////        do {
////            let insert = shit_record.insert(self.shit_id <- some, shit id)
////            try db.run(insert)
////            print("User inserted successfully.")
////        } catch {
////            print("Error inserting user: \(error)")
////        }
////    }
//
//    // Query all users from the database.
//    func getAllUsers() -> [String] {
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
//
//    // Update a user's username by ID.
//    func updateUser(id: Int, newUsername: String) {
//        let userToUpdate = shit_record.filter(self.id == id)
//
//        do {
//            let update = userToUpdate.update(username <- newUsername)
//            try db.run(update)
//            print("User updated successfully.")
//        } catch {
//            print("Error updating user: \(error)")
//        }
//    }
//
//    // Delete a user by ID.
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
//
//    // Close the database connection when done.
////    func closeDatabase() {
////        db.close()
////    }
//}
