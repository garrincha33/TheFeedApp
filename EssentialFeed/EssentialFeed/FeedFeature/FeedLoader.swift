//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Richard Price on 16/12/2020.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping () -> Void)
}
