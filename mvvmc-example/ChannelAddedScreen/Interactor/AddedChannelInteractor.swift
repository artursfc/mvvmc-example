//
//  AddedChannelInteractor.swift
//  mvvmc-example
//
//  Created by Artur Carneiro on 05/01/20.
//  Copyright © 2020 Artur Carneiro. All rights reserved.
//

import Foundation
import CoreData

final class AddedChannelInteractor {
    private let container: NSPersistentContainer
    private let context: NSManagedObjectContext
    private var channels = [Channel]()

    init() {
        container = NSPersistentContainer(name: "mvvmc_example")
        container.loadPersistentStores { (_, error) in
            if let error = error as NSError? {
                fatalError("Could not load Core Data. \(error), \(error.userInfo)")
            }
        }
        context = container.viewContext
        setup()
    }

    private func setup() {
        do {
            channels = try context.fetch(Channel.fetchRequest())
        } catch let error as NSError {
            print("Failed to retrieve Channels from Core Data. \(error), \(error.userInfo)")
        }
    }

    func fetch() -> ChannelModel {
        let channel = channels.last
        let model = ChannelModel(name: channel?.name ?? "", date: channel?.date ?? "", tags: channel?.tags ?? "")
        return model
    }
}
