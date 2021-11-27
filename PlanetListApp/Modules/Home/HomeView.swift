//
//  HomeView.swift
//  MLSearchApp
//
//  Created by David Figueroa on 11/04/21.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var presenter: HomePresenter
    @State private var isEditing = false
    
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    private var viewController: UIViewController? {
        self.viewControllerHolder
    }

    var body: some View {
        VStack{
            Image("MainLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .padding(.top, 30)
                .padding(.bottom, 10)
            
            Text("Planet List")
                .font(.custom("Harabara Mais Bold", size: 25))
                .foregroundColor(PlanetsAppColors.darkBlue)
                .padding(.bottom, 15)
            
            if presenter.isLoading {
                ProgressView("Loading...")
            }
            
            if presenter.showMessage {
                MessageView(showMessage: $presenter.showMessage, message: presenter.errorMessage, isError: true)
            }
            
            List(presenter.planets) { planet in
                Button (action: {
                    self.viewController?.present(style: .fullScreen, transitionStyle: .flipHorizontal) {
                            ProductDetailViewControllerUI(planet: planet)
                    }
                }) {
                    PlanetCell(planet: planet)
                }
            }
            
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(presenter: HomePresenter(interactor: HomeInteractor()))
    }
}
