//
//  Episodes.swift
//  The Big Bang
//
//  Created by Pedro  on 16/6/23.
//

import SwiftUI

struct EpisodesRow: View {
    
    let bigbang:BigBang
   
    @EnvironmentObject var favoritos:ViewModelFavorite
    
    var body: some View {
        
        NavigationLink(destination: DetailsView(bigbang: bigbang)) {
            
            VStack {
                Text("\(bigbang.name)")
                    .font(.custom("Roboto", size: 20))
                    .foregroundColor(.indigo)
                    .bold()
                HStack {
                    
                    VStack {
                       
                        Text("Number \(bigbang.number)")
                            .font(.custom("Roboto", size: 16))
                            .foregroundColor(.indigo)
                            .padding()
                    }
                    Spacer()
                    Image("\(bigbang.image)")
                        .resizable()
                        .frame(width: 200, height: 150)
                        .cornerRadius(10)
                    
                    Button(action:{
                        if favoritos.contains(bigbang) {
                            favoritos.removeFavorite(bigbang)
                        } else {
                            favoritos.addFavorites(bigbang)
                        }
                    }) {
                        Image(systemName:favoritos.contains(bigbang) ?  "star.fill" : "star")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(favoritos.contains(bigbang) ? .yellow : .red)
                            .padding()
                    }
                }
                .background(Color.blue.opacity(0.3))
                .cornerRadius(10)
                .shadow(color: Color.gray, radius: 10, x: 0, y: 2)
            .padding()
            }
            .shadow(color: Color.gray, radius: 10, x: 0, y: 2)
        }
        .navigationTitle(Text("Season \(bigbang.season)"))
        
    }
}

struct EpisodesRow_Previews: PreviewProvider {
    static var previews: some View {
        EpisodesRow(bigbang: .testBigBang)
            .environmentObject(ViewModelFavorite())
            
    }
}
