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
	@NSManaged internal var id: UUID
	@NSManaged internal var imageDescription: String?
	@NSManaged internal var location: String?
	@NSManaged internal var url: URL
	@NSManaged internal var cache: Cache
}
