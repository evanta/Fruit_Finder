//
//  Fruit_FinderApp.swift
//  Fruit_Finder
//
//  Created by Evan Taylor on 4/28/25.
//

import SwiftUI

@main
struct Fruit_FinderApp: App {
    @StateObject private var winner = GameWinner()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(winner)
        }
    }
}
