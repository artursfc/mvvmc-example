//
//  Channel+CoreDataProperties.swift
//  mvvmc-example
//
//  Created by Artur Carneiro on 05/01/20.
//  Copyright © 2020 Artur Carneiro. All rights reserved.
//
//

import Foundation
import CoreData

extension Channel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Channel> {
        return NSFetchRequest<Channel>(entityName: "Channel")
    }

    @NSManaged public var name: String?
    @NSManaged public var date: String?
    @NSManaged public var tags: String?
    @NSManaged public var posts: NSSet?

}

// MARK: Generated accessors for posts
extension Channel {

    @objc(addPostsObject:)
    @NSManaged public func addToPosts(_ value: Post)

    @objc(removePostsObject:)
    @NSManaged public func removeFromPosts(_ value: Post)

    @objc(addPosts:)
    @NSManaged public func addToPosts(_ values: NSSet)

    @objc(removePosts:)
    @NSManaged public func removeFromPosts(_ values: NSSet)

}
