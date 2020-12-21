//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Richard Price on 21/12/2020.
//
//step 1 create a remotefeedloader test file
//step 2 create 2 classes remote feed loader and a httpClient for our request
import XCTest

class RemoteFeedLoader {
    //step 1  create a test URL and create an instance of client
    let client: HTTPClient
    let url: URL
    
    init(url: URL, client:HTTPClient) {
        self.url = url
        self.client = client
    }
    func load() {
        client.get(from: url)
    }
}
//step 2 create a protocol rather than a singleton change test cases, use a get function
//protocols are much better swift for creating interfaces, as there is just a definicion
protocol HTTPClient {
    func get(from url: URL)
}
//step 3 create a remote feedloader test to make sure a URL is requested
class RemoteFeedLoaderTests: XCTestCase {
    func test_init_doesNotRequestDataFromURL() {
        //step
        let(_, client) = makeSUT()
        
        //we are asserting that we didnt make a URL request
        //since that would only happen when .load is invoked
        XCTAssertNil(client.requestedURL)
    }
    //step 4 create a test to make sure we have actually requested a URL
    func test_load_requestDataFromURL() {
        //step
        let url = URL(string: "https://a-given-url.com")!
        let (sut, client) = makeSUT(url: url)
        //3 types of dependency injection, constructor, property or method injection
        //other ways would be to use a static let singleton
        sut.load()
        //step  create a way of controlling which URL is passed in
        XCTAssertEqual(client.requestedURL, url)
    }
    
    //helpers
    //step 5 create a function that makes our SUT test URL, we return a tuple so we have
    // the option of returning multiple values
    private func makeSUT(url: URL = URL(string: "https://a-url.com")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy) {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        return (sut, client)
    }
    
    //step 6    create a spy subclass that will be used for tests only so we dont touch production
    //keep production code as generic as possible
    private class HTTPClientSpy: HTTPClient {
        var requestedURL: URL?
        func get(from url: URL) {
            requestedURL = url
        }
    }
}
