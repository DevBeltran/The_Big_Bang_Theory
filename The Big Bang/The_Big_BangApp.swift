//
//  The_Big_BangApp.swift
//  The Big Bang
//
//  Created by Pedro  on 16/6/23.
//

import SwiftUI

@main
struct The_Big_BangApp: App {
    @StateObject var favoriteVM = ViewModelFavorite()
    var body: some Scene {
        
        WindowGroup {
            
            TabView {
                
                SeasonViewlist(bigbang: .testBigBang)
                    .tabItem {
                        Label("Season", systemImage: "tv")
                    }
                FavoritesView()
                    .tabItem {
                        Label("Favorite", systemImage: "star")
                        
                    }
            }
            .environmentObject(ViewModelFavorite())
        }
    }
}
