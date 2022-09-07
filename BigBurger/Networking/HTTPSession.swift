//
//  HTTPSession.swift
//  BigBurger
//
//  Created by walid on 7/9/2022.
//

import Foundation
protocol HTTPSession {
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> HTTPSessionTask
}

protocol HTTPSessionTask {
    func resume()
}
