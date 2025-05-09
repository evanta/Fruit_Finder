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
                Image("Background")
                    .resizable()
                    .ignoresSafeArea()
                
                Image("TitleBG")
                    .resizable()
                    .ignoresSafeArea()
                    
                
                
                
                VStack {
                    Image("Title")
                        .resizable()
                        .fixedSize(horizontal: false, vertical: true)
                        .padding()
                    
                            
                        
                    
                    NavigationLink(destination: gameplayview()) {
                        Image("Play")
                            .padding()
                            .foregroundColor(.black)
                            .font(.title)
                            .cornerRadius(10)
                            .padding(.bottom, 10)
                    }
                    
                    NavigationLink(destination: LeaderboardView()) {
                        Image("Leaderboard")
                            .padding()
                            
                            .foregroundColor(.black)
                            .font(.title)
                            .cornerRadius(10)
                            .padding(.bottom, 10)
                    }
                    
                    NavigationLink(destination: fruitfactview()) {
                        Image("FruitFacts")
                            .padding()
                            
                            .foregroundColor(.black)
                            .font(.title)
                            .cornerRadius(10)
                            .padding(.bottom, 10)
                    }
                    
                    NavigationLink(destination: aboutview()) {
                        Image("About")
                            .padding()
                            
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
