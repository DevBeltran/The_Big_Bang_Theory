//
//  SeasonViewlist.swift
//  The Big Bang
//
//  Created by Pedro  on 21/6/23.
//

import SwiftUI

struct SeasonViewlist: View {
    @EnvironmentObject var favorites:ViewModelFavorite
    let sesiones: [Cover] = (1...12).map { Cover(imageName: "season\($0)", number: $0) }
    let bigbang:BigBang
    
    @ObservedObject var BigVm = BigBangVM()
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                Text("The Big Bang Theory")
                    .font(.custom("Roboto", size: 30))
                    .foregroundColor(.indigo)
                    .bold()
                    .padding()
               
                LazyVStack {
                    ForEach(sesiones) { season in
                        
                        NavigationLink(destination: FilterView(bigbang: bigbang, episodes: BigVm.filSeason(season1: season.number))) {
                            
                            VStack {
                                Text("Season \(season.number)")
                                    .font(.custom("Roboto", size: 20))
                                    .foregroundColor(.indigo)
                               
                                Image(season.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(20)
                                    
                               
                            }
                            
                        }
                    }
                   
                }
            }
            .shadow(color: .gray, radius: 10, x: 0, y: 0)
            .padding()
        }
    }
}
    
struct SeasonViewlist_Previews: PreviewProvider {
            static var previews: some View {
                SeasonViewlist(bigbang: .testBigBang)
                    .environmentObject(ViewModelFavorite())
            }
        }
    

