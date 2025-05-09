//
//  leaderboardview.swift
//  Fruit_Finder
//
//  Created by Evan Taylor on 4/28/25.
//

import SwiftUI

struct LeaderboardEntry: Codable, Identifiable {
    var id = UUID()
    var name: String
    var score: Int
}
		
class LeaderboardManager: ObservableObject {
    @Published var entries: [LeaderboardEntry] = []

    private let leaderboardKey = "fruitGameLeaderboard"

    init() {
        loadLeaderboard()
    }

    func addEntry(name: String, score: Int) {
        let newEntry = LeaderboardEntry(name: name, score: score)
        entries.append(newEntry)
        entries.sort { $0.score > $1.score }  // High score first
        saveLeaderboard()
    }

    private func saveLeaderboard() {
        if let data = try? JSONEncoder().encode(entries) {
            UserDefaults.standard.set(data, forKey: leaderboardKey)
        }
    }

    private func loadLeaderboard() {
        if let data = UserDefaults.standard.data(forKey: leaderboardKey),
           let savedEntries = try? JSONDecoder().decode([LeaderboardEntry].self, from: data) {
            entries = savedEntries
        }
    }

    func clearLeaderboard() {
        entries = []
        UserDefaults.standard.removeObject(forKey: leaderboardKey)
    }
}


struct LeaderboardView: View {
    @EnvironmentObject var leaderboardManager: LeaderboardManager
    
    var body: some View {
        ZStack{
            Image("Background")
                .resizable()
                .ignoresSafeArea()
                
            
            List(leaderboardManager.entries) { entry in
                HStack {
                    Text(entry.name)
                    Spacer()
                    Text("\(entry.score)")
                }
            }
            .background(Color.clear)
            .scrollContentBackground(.hidden)
            .navigationTitle("Leaderboard")
        }
        
    }
}

struct leaderboardview_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView()
    }
}
