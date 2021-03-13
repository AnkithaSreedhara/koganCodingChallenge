//
//  MockURLSession.swift
//  koganCodingChallengeTests
//
//  Created by Anki on 13/03/21.
//

import Foundation
class MockURLSession: URLSession {
  var cachedUrl: URL?
  override func dataTask(with url: URL, completionHandler: @escaping(Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
    self.cachedUrl = url
    return URLSessionDataTask()
  }
}
