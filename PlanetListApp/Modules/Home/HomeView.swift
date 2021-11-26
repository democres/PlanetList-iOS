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
            
            Text("Mercado Libre Search")
                .font(.custom("Harabara Mais Bold", size: 25))
                .foregroundColor(MLSearchAppColors.darkBlue)
                .padding(.bottom, 15)
            
            TextField("Buscar productos, marcas y más...", text: $presenter.searchText, onCommit: {
                presenter.getSearchResults(searchQuery: presenter.searchText)
            })
            .padding(7)
            .padding(.horizontal, 25)
            .font(.custom("Harabara Mais", size: 18))
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 8)
                    
                    if isEditing {
                        Button(action: { [weak presenter] in
                            self.isEditing = false
                            presenter?.searchText.removeAll()
                            presenter?.articles.removeAll()
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        }) {
                            Image(systemName: "multiply.circle.fill")
                                .foregroundColor(.gray)
                                .padding(.trailing, 8)
                        }
                    }
                }
            )
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
            .onTapGesture {
                self.isEditing = true
            }
            
            if presenter.isLoading {
                ProgressView("Buscando..")
            }
            
            if presenter.showMessage {
                MessageView(showMessage: $presenter.showMessage, message: presenter.errorMessage, isError: true)
            }
            
            List(presenter.articles) { article in
                
                Button (action: {
                    self.viewController?.present(style: .fullScreen, transitionStyle: .flipHorizontal) {
                            ProductDetailViewControllerUI(article: article)
                    }
                }) {
                    ArticleCell(article: article)
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
