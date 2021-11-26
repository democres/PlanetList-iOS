//
//  HomePresenter.swift
//  MLSearchApp
//
//  Created by David Figueroa on 11/04/21.
//

import SwiftUI
import Combine

class HomePresenter: ObservableObject {
    
    // MARK: - Dynamic Properties
    
    @Published var searchText: String = ""
    @Published var isLoading: Bool = false
    @Published var errorMessage: String = "" {
        didSet {
            showMessage = errorMessage != "" ? true : false
        }
    }
    @Published var showMessage: Bool = false
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    
    // MARK: - Properties
    
    private let interactor: HomeInteractor
    private let router = HomeRouter()
    private var cancellables = Set<AnyCancellable>()
    
    public var articles = [Article]()
    
    // MARK: - Init
    
    init(interactor: HomeInteractor) {

        self.interactor = interactor
    }
    
    func getSearchResults(searchQuery: String){
        
        self.isLoading = true
        
        interactor.performSearch(searchQuery: searchQuery)
            .sink(receiveCompletion: { [weak self] errorResponse in
                self?.isLoading = false
                switch errorResponse {
                case .failure(let error):
                    switch error {
                    case .error(let statusCode, let dataResponse, let error):
                        if statusCode == 401{
                            self?.errorMessage = "Auth Error"
                            return
                        } else if statusCode == 501 {
                            self?.errorMessage = "Server Error"
                            return
                        }
                        if let data = dataResponse {
                            self?.errorMessage = data.parseErrorData()
                        } else {
                            self?.errorMessage = error.localizedDescription
                        }
                    }
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] articlesResponse in
                self?.isLoading = false
                self?.articles = articlesResponse.results
            })
            .store(in: &cancellables)
    }
}
