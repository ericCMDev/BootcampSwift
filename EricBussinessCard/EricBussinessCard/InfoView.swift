//
//  InfoView.swift
//  EricBussinessCard
//
//  Created by Eric Cabestany Mena on 13/12/22.
//

import SwiftUI

struct InfoView: View {
    
    let text: String
    let imageName: String
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .frame(height: 50)
            .foregroundColor(.white)
            .overlay(
                HStack {
                    Image(systemName: imageName)
                        .foregroundColor(Color.green)
                    Text(text)
                })
            .padding()
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text: "example info view", imageName: "phone.fill")
            .previewLayout(.sizeThatFits)
    }
}
