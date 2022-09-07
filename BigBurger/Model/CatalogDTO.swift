//
//  CatalogDTO.swift
//  BigBurger
//
//  Created by walid on 7/9/2022.
//

import Foundation

struct CatalogDTO {
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
extension CatalogDTO : Decodable {
    
    enum CodingKeys: String, CodingKey {
        case ref, title
        case description
        case thumbnail, price
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        ref =  try values.decodeIfPresent(String.self, forKey: .ref) ?? ""
        title =  try values.decodeIfPresent(String.self, forKey: .title) ?? ""
        description =  try values.decodeIfPresent(String.self, forKey: .description) ?? ""
        thumbnail =  try values.decodeIfPresent(String.self, forKey: .thumbnail) ?? ""
        price =  try values.decodeIfPresent(Float.self, forKey: .price) ?? 0
    }
}
extension CatalogDTO {
    func toDomain() -> Catalog {
        return .init(ref: ref,title: title,description: description,thumbnail: thumbnail,price: price)
    }
}
