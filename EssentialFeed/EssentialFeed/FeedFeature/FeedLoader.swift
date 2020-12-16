//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Richard Price on 16/12/2020.
//

import Foundation

//step 2 create an enum which can return success or failure
// fine to use this now but later on need to think about creating our own error types
enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}
//step 3 create your load protocol
// at this stage there us nothing to test as yet, everything will
// be checked by the compliler
protocol FeedLoader {
    func load(completion: @escaping () -> Void)
}
