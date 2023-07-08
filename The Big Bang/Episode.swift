//
//  Episode.swift
//  The Big Bang
//
//  Created by Pedro  on 16/6/23.
//

import SwiftUI

struct Episode: View {
    
    
    let bigbang:BigBang
    @ObservedObject var BigVm = BigBangVM()
    
    var body: some View {
        
        ZStack {
            
            Color.indigo.opacity(0.3).ignoresSafeArea()
            ScrollView {
                
                Text("The Big Bang Theory")
                    .font(.custom("Roboto", size: 40))
                    .foregroundColor(.indigo)
                    .padding(.all)
                
                LazyVStack {
                    ForEach(BigVm.filSeason(season1:bigbang.season)){ episode in
                        
                        EpisodesRow(bigbang: episode)
                           
                    }
                }
            }
        }
        
    }
}

struct Episode_Previews: PreviewProvider {
    static var previews: some View {
        Episode( bigbang: .testBigBang)
            .environmentObject(ViewModelFavorite())
    }
}
