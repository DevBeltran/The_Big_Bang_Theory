//
//  ModelPresistence.swift
//  The Big Bang
//
//  Created by Pedro  on 19/6/23.
//


import Foundation
import SwiftUI
import UIKit


func loadBig() -> [BigBang] {
    
    guard let url = Bundle.main.url(forResource: "BigBang", withExtension: "json") else {
        return []
    }
    do {
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode([BigBang].self, from: data)
    } catch {
        print("Error en la carga \(error)")
        return []
    }
}



