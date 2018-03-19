//
//  DataController.swift
//  Mooskine
//
//  Created by Guilherme on 3/10/18.
//  Copyright © 2018 Udacity. All rights reserved.
//

import Foundation
import CoreData

class DataController {
    let persistendContainer: NSPersistentContainer

    var viewContext: NSManagedObjectContext {
        return persistendContainer.viewContext
    }

    init(modelName: String) {
        persistendContainer = NSPersistentContainer(name: modelName)
    }

    func load(completion: (() -> Void)? = nil) {
        persistendContainer.loadPersistentStores { storeDescription, error in
            guard error == nil else {
                fatalError(error!.localizedDescription)
            }
            self.autoSaveViewContext()
            completion?()
        }
    }
}

extension DataController {
    func autoSaveViewContext(interval: TimeInterval = 30) {
        guard interval > 0 else {
            print("cannot set negative autosave interval")
            return
        }

        try? self.viewContext.checkAndSave()
        DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
            self.autoSaveViewContext(interval: interval)
        }
    }
}
