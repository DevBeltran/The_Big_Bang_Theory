//
//  FilterView.swift
//  The Big Bang
//
//  Created by Pedro  on 27/6/23.
//

import SwiftUI

struct FilterView: View {
    @State private var isFavorite:Bool = false
    let bigbang:BigBang
    let episodes:[BigBang] // para poder recorrer los episodios
    @EnvironmentObject var favorite:ViewModelFavorite
    var body: some View {
        
        ZStack {
            
            Color.indigo.opacity(0.3).ignoresSafeArea()
            
            ScrollView {
                
                Text("The Big Bang Theory")
                    .font(.custom("Roboto", size: 35))
                    .padding(.all)
                
                LazyVStack {
                    ForEach(episodes) { epi in
                        
                        EpisodesRow(bigbang: epi) 
                    }
                    
                }
            }
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(bigbang: .testBigBang, episodes: [.testBigBang])
            .environmentObject(ViewModelFavorite())
    }
}
