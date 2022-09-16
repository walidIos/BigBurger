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
    var listInCart = [Catalog]()
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
    
  
    func getCountList() -> Int {
        return listCatlog.count
    }
    
 
    func getCatalogList() -> [Catalog] {
        return listCatlog
    }
    
    func addRemoveProduct(_ index : Int) {
        guard let model = self.getItemsByIndex(index: index) else { return }
        guard let item = self.listInCart.filter({
            $0.ref == model.ref
        }).first
        else {
            self.listInCart.append(model)
            return
        }
        self.listInCart = self.listInCart.filter({
            $0.ref != model.ref
            
        })
    }
    
    func isIncarte(_ index : Int ) -> Bool{
        guard let model = self.getItemsByIndex(index: index) else { return false }
       return !self.listInCart.filter({
            $0.ref == model.ref
        }).isEmpty
        
    }
    func getItemsCarteByIndex(index: Int) -> Catalog? {
        guard index >= 0 && index < self.listInCart.count else {
            return nil
        }
        return listInCart[index]
    }
    
    func getCatalogCartList() -> [Catalog] {
        return listInCart
    }
    func calculatePrice() -> Float {
        var some = Float()
        listInCart.forEach{ catalogInCart in
            some += catalogInCart.price 
        }
        return some
    }
}
