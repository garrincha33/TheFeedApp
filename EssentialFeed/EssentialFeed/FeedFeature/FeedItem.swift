//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by Richard Price on 16/12/2020.
//

import Foundation
//step 1 create your feed item struct, based on requirements given to us
struct FeedItem {
    let id: UUID
    let description: String?
    let location: String?
    let imageURL: URL
}
