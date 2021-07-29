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
	@NSManaged var timestamp: Date
	@NSManaged var cachedFeedStoreImage: NSOrderedSet

	var localFeedStore: [LocalFeedImage] {
		return cachedFeedStoreImage.compactMap { ($0 as? CachedFeedStoreImage)?.localFeedImage }
	}

	static func get(in context: NSManagedObjectContext) throws -> Cache? {
		guard let cacheEntityName = entity().name else { return nil }
		let request = NSFetchRequest<Cache>(entityName: cacheEntityName)
		request.returnsObjectsAsFaults = false
		return try context.fetch(request).first
	}

	static func create(in context: NSManagedObjectContext) throws -> Cache {
		try get(in: context).map(context.delete)
		return Cache(context: context)
	}
}
