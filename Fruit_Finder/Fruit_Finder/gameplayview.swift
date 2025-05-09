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
    @State private var GameStarted:Bool = false
    @State private var SelectedFruits: [String] = []
    @State private var showGameOverPopup = false
    @State private var playerName = ""
    @EnvironmentObject var leaderboardManager: LeaderboardManager

    
    @State private var RandomFruitList:[String] = ["Banana", "Blackberry", "Durian", "Fig", "Gooseberry", "GreenApple", "Kiwi", "Lingonberry", "Lychee", "Orange", "Passionfruit", "Pear", "Persimmon", "Pineapple", "Plum", "Strawberry", "Tomato"]
    
    func ShuffleFruit(){
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

    }
    var body: some View {
        
        
        ZStack{
            Image("Background")
                .resizable()
                .ignoresSafeArea()
            
            if !GameStarted {
                Button(action: {
                    GameStarted = true
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
                })  {
                    Image("Start")
                        .resizable()
                        .fixedSize(horizontal: false, vertical: true)
                    
                }
            }
            
            
            VStack {
                
                if GameStarted {
                    Text("Score: \(ScoreCount)  Misses: \(MissCount)")
                        .font(.headline)
                        .foregroundColor(Color.green)
                        .background(Color.purple)
                        .padding()
                    
                    HStack {
                        //Fruit image as a button. when you press the button, it updates winner name.
                        //winner name should be the name of the fruit that the play matched correctly.
                        //This is just an example of how you can update winner.name with a button.
                        Button {
                            if SelectedFruits.count < 2 {
                                SelectedFruits.append(fruit1)
                            }
                            else if SelectedFruits.count >= 2 {
                                let selectedArray = Array(SelectedFruits)
                                if selectedArray[0] == selectedArray[1]{
                                    ScoreCount += 1
                                    SelectedFruits.removeAll()
                                    ShuffleFruit()
                                    
                                } else{
                                    MissCount += 1
                                    if MissCount >= 3 {
                                        GameOver = true
                                        GameStarted = false
                                        showGameOverPopup = true
                                        winner.name = (fruit1)
                                    }
                                    SelectedFruits.removeAll()
                                    ShuffleFruit()
                                }
                            }
                            
                        }
                    label: {
                        Image(fruit1)
                            .resizable()
                            .shadow(radius: 5)
                        // Enlarge when selected
                    }
                        
                        
                        //This is just an example of how you can update winner.name with a button.
                        Button {
                            if SelectedFruits.count < 2 {
                                SelectedFruits.append(fruit2)
                            }
                            else if SelectedFruits.count == 2 {
                                let selectedArray = Array(SelectedFruits)
                                if selectedArray[0] == selectedArray[1]{
                                    ScoreCount += 1
                                    SelectedFruits.removeAll()
                                    ShuffleFruit()
                                    
                                } else{
                                    MissCount += 1
                                    if MissCount >= 3 {
                                        GameOver = true
                                        GameStarted = false
                                        showGameOverPopup = true
                                        winner.name = (fruit2)
                                    }
                                    SelectedFruits.removeAll()
                                    ShuffleFruit()
                                    
                                }
                            }
                            
                        }
                    label: {
                        Image(fruit2)
                            .resizable()
                            .shadow(radius: 5)
                        // Enlarge when selected
                    }                } // end HStack
                    
                    HStack {
                        Button {
                            if SelectedFruits.count < 2 {
                                SelectedFruits.append(fruit3)
                            }
                            else if SelectedFruits.count == 2 {
                                let selectedArray = Array(SelectedFruits)
                                if selectedArray[0] == selectedArray[1]{
                                    ScoreCount += 1
                                    SelectedFruits.removeAll()
                                    ShuffleFruit()
                                    
                                } else{
                                    MissCount += 1
                                    if MissCount >= 3 {
                                        GameOver = true
                                        GameStarted = false
                                        showGameOverPopup = true
                                        winner.name = (fruit3)
                                    }
                                    SelectedFruits.removeAll()
                                    ShuffleFruit()
                                }
                            }
                            
                            
                        }
                    label: {
                        Image(fruit3)
                            .resizable()
                            .shadow(radius: 5)
                        // Enlarge when selected
                    }
                        
                        //This is just an example of how you can update winner.name with a button.
                        Button {
                            if SelectedFruits.count < 2 {
                                SelectedFruits.append(fruit4)
                            }
                            else if SelectedFruits.count == 2 {
                                let selectedArray = Array(SelectedFruits)
                                if selectedArray[0] == selectedArray[1]{
                                    ScoreCount += 1
                                    SelectedFruits.removeAll()
                                    ShuffleFruit()
                                    
                                } else{
                                    MissCount += 1
                                    if MissCount >= 3 {
                                        GameOver = true
                                        GameStarted = false
                                        showGameOverPopup = true
                                        winner.name = (fruit4)
                                    }
                                    SelectedFruits.removeAll()
                                    ShuffleFruit()
                                    
                                }
                            }
                            
                        }
                    label: {
                        Image(fruit4)
                            .resizable()
                            .shadow(radius: 5)
                        // Enlarge when selected
                    }               }
                    HStack {
                        Button {
                            if SelectedFruits.count < 2 {
                                SelectedFruits.append(fruit5)
                            }
                            else if SelectedFruits.count == 2 {
                                let selectedArray = Array(SelectedFruits)
                                if selectedArray[0] == selectedArray[1]{
                                    ScoreCount += 1
                                    SelectedFruits.removeAll()
                                    ShuffleFruit()
                                    
                                } else{
                                    MissCount += 1
                                    if MissCount >= 3 {
                                        GameOver = true
                                        GameStarted = false
                                        showGameOverPopup = true
                                        winner.name = (fruit5)
                                    }
                                    SelectedFruits.removeAll()
                                    ShuffleFruit()
                                }
                                
                            }
                            
                        }
                    label: {
                        Image(fruit5)
                            .resizable()
                            .shadow(radius: 5)
                        // Enlarge when selected
                    }
                        
                        //This is just an example of how you can update winner.name with a button.
                        Button {
                            if SelectedFruits.count < 2 {
                                SelectedFruits.append(fruit6)
                            }
                            else if SelectedFruits.count == 2 {
                                let selectedArray = Array(SelectedFruits)
                                if selectedArray[0] == selectedArray[1]{
                                    ScoreCount += 1
                                    SelectedFruits.removeAll()
                                    ShuffleFruit()
                                    
                                } else{
                                    MissCount += 1
                                    if MissCount >= 3 {
                                        GameOver = true
                                        GameStarted = false
                                        showGameOverPopup = true
                                        winner.name = (fruit6)
                                    }
                                    SelectedFruits.removeAll()
                                    ShuffleFruit()
                                }
                                
                            }
                            
                        }
                    label: {
                        Image(fruit6)
                            .resizable()
                            .shadow(radius: 5)
                        
                    }
                            
                                

                        }
                    }
                    
                }
                
            }
        .alert("Game Over", isPresented: $showGameOverPopup) {
            TextField("Enter Name", text: $playerName)
            Button("Submit") {
                leaderboardManager.addEntry(name: playerName, score: ScoreCount)
            }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Your score: \(ScoreCount)")
        }
        }
    }
    


//do not change this #Preview section. It breaks the preview on xcode.
//Our Profs code is not directly transferable
struct gameplayview_Previews: PreviewProvider {
    static var previews: some View {
        
        gameplayview()
            .environmentObject(GameWinner())
            .environmentObject(LeaderboardManager())
    }
}
