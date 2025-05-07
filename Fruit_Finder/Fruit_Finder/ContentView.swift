//
//  ContentView.swift
//  Fruit_Finder
//
//  Created by Evan Taylor on 4/28/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(.purple)
                    .ignoresSafeArea()
                
                VStack {
                    Text("Fruit finder")
                        .padding()
                        .font(.system(size: 45))
                    
                    NavigationLink(destination: gameplayview()) {
                        Text("Play!")
                            .padding()
                            .background(Color.white)
                            .foregroundColor(.black)
                            .font(.title)
                            .cornerRadius(10)
                            .padding(.bottom, 10)
                    }
                    
                    NavigationLink(destination: leaderboardview()) {
                        Text("Leaderboard")
                            .padding()
                            .background(Color.white)
                            .foregroundColor(.black)
                            .font(.title)
                            .cornerRadius(10)
                            .padding(.bottom, 10)
                    }
                    
                    NavigationLink(destination: fruitfactview()) {
                        Text("Fruit Facts")
                            .padding()
                            .background(Color.white)
                            .foregroundColor(.black)
                            .font(.title)
                            .cornerRadius(10)
                            .padding(.bottom, 10)
                    }
                    
                    NavigationLink(destination: aboutview()) {
                        Text("About")
                            .padding()
                            .background(Color.white)
                            .foregroundColor(.black)
                            .font(.title)
                            .cornerRadius(10)
                            .padding(.bottom, 10)
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
