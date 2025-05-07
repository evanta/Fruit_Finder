//
//  gameplayview.swift
//  Fruit_Finder
//
//  Created by Evan Taylor on 4/28/25.
//

import SwiftUI

//change the GameWinner object.name to whatever the name of the winning friut is.
//the name has to be the same as the name of the of the image.
class GameWinner: ObservableObject {
    @Published var name: String = ""
}

struct gameplayview: View {
    @State private var fruit1:String = "Banana"
    @State private var fruit2:String = "Blackberry"
    @State private var fruit3:String = "Durian"
    @State private var fruit4:String = "Fig"
    @State private var fruit5:String = "Gooseberry"
    @State private var fruit6:String = "GreenApple"
    @EnvironmentObject var winner: GameWinner


    var body: some View {
        ZStack{
            Color(.purple)
                .ignoresSafeArea()
            VStack {
                HStack {
                    //Fruit image as a button. when you press the button, it updates winner name.
                    //winner name should be the name of the fruit that the play matched correctly.
                    //This is just an example of how you can update winner.name with a button.
                    Button {action: do {
                        winner.name = "Banana"
                    }} label: {
                        Image(fruit1)
                            .resizable()
                    }
                    
                    //This is just an example of how you can update winner.name with a button.
                    Button {action: do {
                        winner.name = "Blackberry"
                    }} label: {
                        Image(fruit2)
                            .resizable()
                    }                } // end HStack
                
                HStack {
                    Image(fruit3)
                        .resizable()
                    
                    Image(fruit4)
                        .resizable()
                } // end HStack
                HStack {
                    Image(fruit5)
                        .resizable()
                    
                    Image(fruit6)
                        .resizable()
                } // end HStack
            }
            .padding()
            
            
        }
    }
}

#Preview {
    gameplayview()
        .environmentObject(GameWinner())
}
