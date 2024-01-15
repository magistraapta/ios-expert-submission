//
//  DetailView.swift
//  dicoding-ios-expert-submission
//
//  Created by Magistra Apta on 15/01/24.
//

import SwiftUI

struct DetailView: View {
    
    @ObservedObject var presenter: DetailPresenter
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: presenter.game.backgroundImage)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height:200)
            } placeholder: {
                Rectangle()
                    .foregroundColor(.secondary)
                    .frame(width: 350,height:200)
            }
            
            HStack{
                Text(presenter.game.name)
                    .font(.title2)
                    .bold()
                
                Image(systemName: "heart")
                    .font(.title2)
                    
            }

        }
    }
}


