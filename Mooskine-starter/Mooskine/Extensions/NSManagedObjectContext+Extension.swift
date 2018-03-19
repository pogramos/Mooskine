//
//  NSManagedObjectContext+Extension.swift
//  Mooskine
//
//  Created by Guilherme on 3/10/18.
//  Copyright © 2018 Udacity. All rights reserved.
//

import Foundation
import CoreData

extension NSManagedObjectContext {

    func checkAndSave() throws {
        do {
            if self.hasChanges {
                try self.save()
            }
        } catch let error {
            throw error
        }
    }

}
