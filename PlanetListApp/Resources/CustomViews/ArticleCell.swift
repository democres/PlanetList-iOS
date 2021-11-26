//
//  ArticleCell.swift
//  MLSearchApp
//
//  Created by David Figueroa on 12/04/21.
//

import SwiftUI
import Kingfisher

struct ArticleCell: View {
    
    var planet: Planet

    var body: some View {
        HStack{
//            if let url = URL(string: article.thumbnail) {
//                KFImage(url)
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 80, height: 80)
//                    .cornerRadius(10)
//            }
            
            VStack(alignment: .leading) {
                Text(planet.title).font(.custom("Harabara Mais", size: 15))
                Text(planet.population).font(.custom("Harabara Mais Bold", size: 16))
//                Text("Come and eat at \(article.title)").font(.custom("Harabara Mais Light", size: 12))
            }.multilineTextAlignment(.leading)
            .padding(.horizontal, 10)
            
        }.frame(height: 120)
    }
}
