//
//  HomeInteractor.swift
//  MLSearchApp
//
//  Created by David Figueroa on 11/04/21.
//

import Combine
import Foundation

class HomeInteractor {
    
    let apiService = APIService()
    
    func getPlanets() -> AnyPublisher<[Planet], Error> {
        let subject = PassthroughSubject<[Planet], Error>()
        
        guard let request = apiService.createRequestWithURLComponents(requestType: .getPlanets) else { return subject.eraseToAnyPublisher() }
        
        apiService.sendRequest(model: GETPlanetsWrapper.self, request: request) { [weak self] resultResponse in
            switch resultResponse {
            case .success(let data):
                subject.send(data.results)
                subject.send(completion: .finished)
            case .failure(let error):
                subject.send(completion: .failure(error))
            }
        }
        
        return subject.eraseToAnyPublisher()
    }
//    func performSearch(searchQuery: String) -> AnyPublisher<ArticleResponse, ErrorResponse> {
//
//        let subject = PassthroughSubject<ArticleResponse, ErrorResponse>()
//
//        HomeAPI.searchArticles(searchQuery: searchQuery) { (articleResponse, error) in
//            if let errorResponse = error {
//                subject.send(completion: .failure(errorResponse))
//            } else {
//                if let autofundingResponse = articleResponse {
//                    subject.send(autofundingResponse)
//                    subject.send(completion: .finished)
//                }
//            }
//        }
//
//        return subject.eraseToAnyPublisher()
//    }
}
