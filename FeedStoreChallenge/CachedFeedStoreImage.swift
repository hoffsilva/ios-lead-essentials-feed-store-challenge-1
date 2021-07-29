//
//  CachedFeedStoreImage.swift
//  FeedStoreChallenge
//
//  Created by Hoff Henry Pereira da Silva on 27/07/21.
//  Copyright © 2021 Essential Developer. All rights reserved.
//

import CoreData

@objc(CachedFeedStoreImage)
final class CachedFeedStoreImage: NSManagedObject {
	@NSManaged var id: UUID
	@NSManaged var imageDescription: String?
	@NSManaged var location: String?
	@NSManaged var url: URL
	@NSManaged var cache: Cache

	var localFeedImage: LocalFeedImage {
		return LocalFeedImage(
			id: id,
			description: imageDescription,
			location: location,
			url: url
		)
	}

	static func transform(_ listOfLocalFeedImage: [LocalFeedImage], in context: NSManagedObjectContext) -> NSOrderedSet {
		return NSOrderedSet(
			array: listOfLocalFeedImage
				.map { local in
					let managed = CachedFeedStoreImage(context: context)
					managed.id = local.id
					managed.imageDescription = local.description
					managed.location = local.location
					managed.url = local.url
					return managed
				}
		)
	}
}
