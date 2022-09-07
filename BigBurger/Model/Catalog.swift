//
//  Catalog.swift
//  BigBurger
//
//  Created by walid on 7/9/2022.
//

import Foundation
struct Catalog {
    let ref : String
    let title : String
    let description : String
    let thumbnail : String
    let price : Float
    
    init(ref: String, title: String, description: String, thumbnail: String, price: Float) {
        self.ref = ref
        self.title = title
        self.description = description
        self.thumbnail = thumbnail
        self.price = price
    }
    
}
