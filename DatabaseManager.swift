import Foundation
import SQLite

class DatabaseManager {
    static let shared = DatabaseManager() 
    private var db: Connection?

    private let usersTable = Table("users")
    private let id = Expression<Int64>("id")
    private let height = Expression<Double>("height")
    private let weight = Expression<Double>("weight")
    private let sex = Expression<String>("sex")

    private init() {
        do {
            let path = NSSearchPathForDirectoriesInDomains(
                .documentDirectory, .userDomainMask, true
            ).first!
            db = try Connection("\(path)/db.sqlite3")
            createTable()
        } catch {
            print("Unable to initialize database: \(error)")
        }
    }

    private func createTable() {
        let createTable = usersTable.create { table in
            table.column(id, primaryKey: .autoincrement)
            table.column(height)
            table.column(weight)
            table.column(sex)
        }

        do {
            try db?.run(createTable)
            print("Created table")
        } catch {
            print("Unable to create table: \(error)")
        }
    }

    func addUser(height: Double, weight: Double, sex: String) {
        let insert = usersTable.insert(self.height <- height, self.weight <- weight, self.sex <- sex)
        do {
            let rowId = try db?.run(insert)
            print("Inserted user with id: \(String(describing: rowId))")
        } catch {
            print("Insertion failed: \(error)")
        }
    }

    func getAllUsers() -> [(height: Double, weight: Double, sex: String)] {
        var users = [(height: Double, weight: Double, sex: String)]()
        do {
            for user in try db!.prepare(usersTable) {
                users.append((height: user[height], weight: user[weight], sex: user[sex]))
            }
        } catch {
            print("Selection failed: \(error)")
        }
        return users
    }
}

