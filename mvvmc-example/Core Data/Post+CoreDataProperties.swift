//
//  Post+CoreDataProperties.swift
//  mvvmc-example
//
//  Created by Artur Carneiro on 05/01/20.
//  Copyright © 2020 Artur Carneiro. All rights reserved.
//
//

import Foundation
import CoreData

extension Post {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Post> {
        return NSFetchRequest<Post>(entityName: "Post")
    }

    @NSManaged public var author: String?
    @NSManaged public var body: String?
    @NSManaged public var date: String?
    @NSManaged public var title: String?
    @NSManaged public var channel: Channel?

}
