//
//  CatalogData.swift
//  BigBurger
//
//  Created by walid on 7/9/2022.
//

import Foundation
final class CatalogRepository {
    private let httpClient: HttpClient
    init(httpClient: HttpClient) {
        self.httpClient = httpClient
    }
    func getListCatalog(completion: @escaping (Result<[CatalogDTO], ApiError>) -> Void) {
        let apiURL = URL(string: Constants.mainUrl)
        let apiRequest = ApiRequest(resource: apiURL!, method: .get)
        httpClient.request(apiRequest) { (result: Result<[CatalogDTO], ApiError>) in
            switch result {
            case .success(let catalog):
                completion(.success(catalog))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
