//
//  ErrorView.swift
//  MLSearchApp
//
//  Created by David Figueroa on 18/04/21.
//

import SwiftUI

struct MessageView: View {
    
    @Binding var showMessage: Bool
    
    var message: String
    var isError: Bool
    
    var body: some View {

        Capsule(style: .continuous)
            .fill(isError == true ? Color.red : MLSearchAppColors.darkBlue)
            .frame(height: 45.0)
            .padding(.horizontal, 20.0)
            .transition(.opacity)
            .overlay(
                HStack {
                    Image(systemName: isError == true ? "exclamationmark.circle" : "checkmark.circle")
                        .foregroundColor(.white)
                        .padding(.leading, 25.0)
                    Text("\(message)")
                        .font(.custom("Harabara Mais", size: 18))
                        .foregroundColor(.white)
                        .padding(.trailing, 25.0)
                }
            )
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0, execute: {
                    self.showMessage = false
            })
        })
    }

}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(showMessage: .constant(true), message: "Message", isError: false)
    }
}
