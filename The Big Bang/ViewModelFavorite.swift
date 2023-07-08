//
//  ViewModelFavorite.swift
//  The Big Bang
//
//  Created by Pedro  on 27/6/23.
//

import Foundation


final class ViewModelFavorite:ObservableObject {
    
    @Published var bigbangFavorite = [BigBang]()
    let saveKey = "Favorites"
    
    init() {
        if let savedata = UserDefaults.standard.data(forKey: saveKey) {
            if let loadepisode = try? JSONDecoder().decode([BigBang].self, from: savedata) {
                self.bigbangFavorite = loadepisode
                return
            }
        }
        self.bigbangFavorite = []
    }
    
 
    func contains(_ namEpisodie:BigBang) -> Bool {
        return bigbangFavorite.contains(where: { $0.name == namEpisodie.name })
    }
  
    func addFavorites(_ namEpisodie:BigBang) {
        if !bigbangFavorite.contains(where: { $0.name == namEpisodie.name }) {
            bigbangFavorite.append(namEpisodie)
        }
    }
    
    func removeFavorite(_ namEpisodie:BigBang) {
        if let index = bigbangFavorite.firstIndex(where: { $0.name == namEpisodie.name }) {
            bigbangFavorite.remove(at: index)
        }
    }
    
        
}


