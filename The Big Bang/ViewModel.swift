//
//  ViewModel.swift
//  The Big Bang
//
//  Created by Pedro  on 16/6/23.
//

import Foundation
import SwiftUI


final class BigBangVM: ObservableObject {
    
    @Published var bigbang:[BigBang] = []
    
    init() {
        
        self.bigbang = loadBig()
       
    }
    
    func filSeason(season1: Int) -> [BigBang] {
        
        return bigbang.filter{ season1 == $0.season}
    }
    
    
    
}
