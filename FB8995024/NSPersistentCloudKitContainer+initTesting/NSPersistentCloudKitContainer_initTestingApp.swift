import CoreData
import SwiftUI

@main
struct NSPersistentCloudKitContainer_initTestingApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            Text("Success")
        }
    }
}

struct PersistenceController {
    static let shared = PersistenceController()
    let container: NSPersistentCloudKitContainer

    init() {
        container = NSPersistentCloudKitContainer(name: "NSPersistentCloudKitContainer_initTesting")

        container.persistentStoreDescriptions[0].cloudKitContainerOptions?.databaseScope = .public

        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })

        do {
            try container.initializeCloudKitSchema()
        } catch {
            fatalError("###\(#function) Error initialising CloudKit schema: \(String(describing: error))")
        }
    }
}
