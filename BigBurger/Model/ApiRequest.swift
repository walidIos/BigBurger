//
//  ApiRequest.swift
//  BigBurger
//
//  Created by walid on 7/9/2022.
//

import Foundation

class ApiRequest {
    
    let resource: URL
    let method: HttpMethod
    let header: [String: String]?
    let json: Data?
    let protected: Bool
    
    init(resource: URL,
         method: HttpMethod = .get,
         header: [String: String]? = nil,
         json: Data? = nil,
         protected: Bool = true) {
        
        self.resource = resource
        self.method = method
        self.header = header
        self.json = json
        self.protected = protected
    }
}
