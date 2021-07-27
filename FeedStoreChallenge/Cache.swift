//
//  Cache.swift
//  FeedStoreChallenge
//
//  Created by Hoff Henry Pereira da Silva on 27/07/21.
//  Copyright © 2021 Essential Developer. All rights reserved.
//

import CoreData

@objc(Cache)
final class Cache: NSManagedObject {
	@NSManaged internal var timestamp: Date
	@NSManaged internal var cachedFeedStoreImage: NSOrderedSet
}
