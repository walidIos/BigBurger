//
//  CatalogData.swift
//  BigBurger
//
//  Created by walid on 7/9/2022.
//

import Foundation
final class Catalogdata {
    var catalogRepository : CatalogRepository
    var listCatlog = [Catalog]()
    init(catalogRepository :CatalogRepository){
        self.catalogRepository = catalogRepository
    }
    func getAllProduct(completion: @escaping ((ApiError?) -> Void)) {
        listCatlog = []
        catalogRepository.getListCatalog{ [weak self] result in
            switch result {
            case .success(let catalog) :
                catalog.forEach {
                    catlogResponse in
                    let product = catlogResponse.toDomain()
                    self?.listCatlog.append(product)
                }
                completion(nil)
                
            case .failure(let error) :
                completion(error)
            }
        }
    
}
}
extension Catalogdata {
    
    func getItemsByIndex(index: Int) -> Catalog? {
        guard index >= 0 && index < self.listCatlog.count else {
            return nil
        }
        return listCatlog[index]
    }
    
    // This function will get count filtred list
    func getCountList() -> Int {
        return listCatlog.count
    }
    
    // This function will get filtred list
    func getCatalogList() -> [Catalog] {
        return listCatlog
    }
}
