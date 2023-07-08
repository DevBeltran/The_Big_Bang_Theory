//
//  DetailsView.swift
//  The Big Bang
//
//  Created by Pedro  on 22/6/23.
//

import SwiftUI

struct DetailsView: View {
    
    let bigbang:BigBang
    @ObservedObject var BigVm = BigBangVM()
    @EnvironmentObject var favoritos:ViewModelFavorite
    
    @State private var showWebViewSafari = false
    var body: some View {
        
        
            
            List {
                Text("The Big Bang Theory")
                    .font(.custom("Roboto", size: 20))
                    .foregroundColor(.indigo)
                    .padding(.leading, 70)
                Text("Name: \(bigbang.name)")
                    .font(.custom("Roboto", size: 16))
                    .foregroundColor(.indigo)
                Image("\(bigbang.image)")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                HStack {
                    Text("Season: \(bigbang.season)")
                        .font(.custom("Roboto", size: 16))
                        .foregroundColor(.indigo)
                        Spacer()
                    Text("Episode: \(bigbang.number)")
                        .font(.custom("Roboto", size: 16))
                        .foregroundColor(.indigo)
                       
                }
                HStack {
                    Text("Duration: \(bigbang.runtime) min")
                        .font(.custom("Roboto", size: 16))
                        .foregroundColor(.indigo)
                        Spacer()
                    Text("Date of issue:  \(bigbang.airdate)")
                        .font(.custom("Roboto", size: 16))
                        .foregroundColor(.indigo)
                       
                }
                VStack(alignment: .leading) {
                    Text("Sumary:")
                        .font(.custom("Roboto", size: 16))
                        .foregroundColor(.indigo)
                        .padding(.bottom, 4)
                    Text("\(bigbang.summary)")
                        .font(.custom("Roboto", size: 16))
                        .foregroundColor(.indigo)
                }

                VStack {
                    
                    Button() {
                        showWebViewSafari = true
                    } label: {
                        Text("Preview Episode")
                }
                    .sheet(isPresented: $showWebViewSafari) {
                        SafariWebView(url: bigbang.url)
                    }
                }
                .frame(width:100, height: 50)
                .background(Color.indigo)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.leading, 90)

                
            }
            
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(bigbang: .testBigBang)
            .environmentObject(ViewModelFavorite())
    }
}
