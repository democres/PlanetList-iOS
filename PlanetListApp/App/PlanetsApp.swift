//
//  PlanetsApp.swift
//  PlanetsApp
//
//  Created by David Figueroa on 11/04/21.
//

import SwiftUI

@main
struct PlanetsApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(presenter: HomePresenter(interactor: HomeInteractor()))
        }
    }
}
