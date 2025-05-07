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
    @State private var ScoreCount:Int = 0
    @State private var MissCount:Int = 0
    @State private var GameOver:Bool = false
    @State private var SelectedFruitArray: Array<String?> = Array(repeating: nil, count: 2)
    @State private var RandomFruitList:[String] = ["Banana", "Blackberry", "Durian", "Fig", "Gooseberry", "GreenApple", "Kiwi", "Lingonberry", "Lychee", "Orange", "Passionfruit", "Pear", "Persimmon", "Pineapple", "Plum", "Strawberry", "Tomato"]

    var body: some View {
        Button(action: {
            
            var randomNumber:Int = 0
            for i in 1...6 {
                
                if i == 1 {
                    randomNumber = Int.random(in: 1...17)
                    fruit1 = RandomFruitList[randomNumber-1]
                }
                else if i == 2 {
                    randomNumber = Int.random(in: 1...17)
                    fruit2 = RandomFruitList[randomNumber-1]
                }
                else if i == 3 {
                    randomNumber = Int.random(in: 1...17)
                    fruit3 = RandomFruitList[randomNumber-1]
                }
                else if i == 4 {
                    randomNumber = Int.random(in: 1...17)
                    fruit4 = RandomFruitList[randomNumber-1]
                }
                else if i == 5 {
                    randomNumber = Int.random(in: 1...17)
                    fruit5 = RandomFruitList[randomNumber-1]
                }
                else if i == 6 {
                    randomNumber = Int.random(in: 1...17)
                    fruit6 = RandomFruitList[randomNumber-1]
                }
                
                
                
            } // end for loop
        }, label: {
            Text("START!")
                .padding()
                .foregroundColor(Color.green)
                .font(.largeTitle)
            
        })
        
        ZStack{
            Color(.purple)
                .ignoresSafeArea()
            VStack {
                HStack {
                    //Fruit image as a button. when you press the button, it updates winner name.
                    //winner name should be the name of the fruit that the play matched correctly.
                    //This is just an example of how you can update winner.name with a button.
                    Button {action: do {
                        winner.name = (fruit1)
                    }} label: {
                        Image(fruit1)
                            .resizable()
                    }
                    
                    //This is just an example of how you can update winner.name with a button.
                    Button {action: do {
                        winner.name = (fruit2)
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

struct gameplayview_Previews: PreviewProvider {
    static var previews: some View {
        gameplayview()
    }
}
