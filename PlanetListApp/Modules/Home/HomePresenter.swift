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
    
    public var planets = [Planet]()
    
    // MARK: - Init
    
    init(interactor: HomeInteractor) {
        self.interactor = interactor
        getPlanets()
    }
    
    func getPlanets(){
        
        self.isLoading = true
        
        interactor.getPlanets()
            .sink(receiveCompletion: { [weak self] errorResponse in
                self?.isLoading = false
                switch errorResponse {
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] planetsResponse in
                self?.isLoading = false
                self?.planets = planetsResponse
            })
            .store(in: &cancellables)
    }
}
