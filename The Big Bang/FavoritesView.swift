//
//  FavoritesView.swift
//  The Big Bang
//
//  Created by Pedro  on 27/6/23.
//

import SwiftUI

struct FavoritesView: View {
    
    @EnvironmentObject var favoriteVM:ViewModelFavorite
    
    var body: some View {
        
        
        ZStack {
            
            Color.indigo.opacity(0.3).ignoresSafeArea()
            ScrollView {
                VStack(alignment:.leading) {
                    Text("Favorites")
                        .font(.custom("Roboto", size: 35))
                        .padding(.all)
                }
                
                VStack(alignment:.leading) {
                    ForEach(favoriteVM.bigbangFavorite, id: \.name) { element in
                        HStack {
                            Text(element.name)
                            
                        }
                        
                            
                    }
                }
               
                
            }
           .frame(maxWidth: 300, alignment: .leading)
        }
        
    }
}
struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
            .environmentObject(ViewModelFavorite())
            
    }
}
