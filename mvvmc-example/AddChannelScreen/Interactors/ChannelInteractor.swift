//
//  ChannelInteractor.swift
//  mvvmc-example
//
//  Created by Artur Carneiro on 01/01/20.
//  Copyright © 2020 Artur Carneiro. All rights reserved.
//

import Foundation
import CoreData

final class ChannelInteractor {
    private let container: NSPersistentContainer
    private let context: NSManagedObjectContext

    init() {
        container = NSPersistentContainer(name: "mvvmc_example")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        context = container.viewContext
    }

    func save(model: ChannelModel) {
        let channel = Channel(context: context)
        channel.name = model.name
        channel.date = model.date
        channel.tags = model.tags
        do {
            try context.save()
        } catch let error as NSError {
            print("Failed to save new Channel to Core Data. \(error), \(error.userInfo)")
        }
    }
}
