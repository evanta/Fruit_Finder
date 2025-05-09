//
//  Fruit_FinderApp.swift
//  Fruit_Finder
//
//  Created by Evan Taylor on 4/28/25.
//


//PLEASE DON'T CHANGE ANYTHING IN THIS SECTION WITHOUT RUNNING IN THE XCODE SIMULATOR
import SwiftUI

@main
struct Fruit_FinderApp: App {
    @StateObject private var winner = GameWinner()
    @StateObject private var leaderboardManager = LeaderboardManager()

//PLEASE DON'T CHANGE ANYTHING IN THIS SECTION WITHOUT RUNNING IN THE XCODE SIMULATOR
    // the .environmentObject(winner) is very important. do not change
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(winner)
                .environmentObject(leaderboardManager)
        }
    }
}
