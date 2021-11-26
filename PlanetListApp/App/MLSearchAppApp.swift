//
//  MLSearchAppApp.swift
//  MLSearchApp
//
//  Created by David Figueroa on 11/04/21.
//

import SwiftUI

@main
struct MLSearchAppApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(presenter: HomePresenter(interactor: HomeInteractor()))
        }
    }
}
