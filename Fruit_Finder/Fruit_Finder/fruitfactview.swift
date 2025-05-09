//
//  fruitfactview.swift
//  Fruit_Finder
//
//  Created by Evan Taylor on 4/28/25.
//

import SwiftUI
import Foundation

struct fruityJson: Decodable {
    var name: String
    var id: Int
    var family: String
    var order: String
    var genus: String
    var nutritions: Nutrition
}

struct Nutrition: Decodable {
    var calories: Double
    var fat: Double
    var sugar: Double
    var carbohydrates: Double
    var protein: Double
}

struct fruitfactview: View {
    @EnvironmentObject var winner: GameWinner
    @State private var fruitimage = "Banana"
    @State private var fruittext = "this is a banana."
    @State private var fruit: fruityJson?
    
    var body: some View {
        ZStack {
                    LinearGradient(gradient: Gradient(colors: [.purple, .indigo]),
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing)
                        .ignoresSafeArea()

                    VStack(spacing: 20) {
                        Image(fruitimage)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .shadow(radius: 10)
                            .padding()

                        if let fruit = fruit {
                            VStack(alignment: .leading, spacing: 10) {
                                Text(fruit.name)
                                    .font(.title)
                                    .bold()

                                Group {
                                    Text("Family: \(fruit.family)")
                                    Text("Genus: \(fruit.genus)")
                                    Text("Order: \(fruit.order)")
                                }
                                .font(.subheadline)

                                Divider()

                                Text("Nutrition Facts")
                                    .font(.headline)
                                    .padding(.bottom, 4)

                                VStack(alignment: .leading, spacing: 4) {
                                    Text("• Calories: \(fruit.nutritions.calories, specifier: "%.1f")")
                                    Text("• Fat: \(fruit.nutritions.fat, specifier: "%.1f")g")
                                    Text("• Sugar: \(fruit.nutritions.sugar, specifier: "%.1f")g")
                                    Text("• Carbohydrates: \(fruit.nutritions.carbohydrates, specifier: "%.1f")g")
                                    Text("• Protein: \(fruit.nutritions.protein, specifier: "%.1f")g")
                                }
                                .font(.footnote)
                            }
                            .padding()
                            .frame(maxWidth: 300)
                            .background(Color.white)
                            .cornerRadius(16)
                            .shadow(radius: 8)
                            .foregroundColor(.black)
                        } else {
                            ProgressView("Loading fruit data...")
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        }
                    }

            .task(id: winner.name) {
                if !winner.name.isEmpty {
                    fruitimage = winner.name
                    await fetchCryptoData()
                }
                winner.name = "Banana"
            }

        }
    }

func fetchCryptoData() async {
    // Corrected URL with "https://"
    guard let url = URL(string: "https://www.fruityvice.com/api/fruit/\(winner.name)") else {
        print("Invalid URL")
        return
    }

    do {
        let (data, _) = try await URLSession.shared.data(from: url)

        // Decode JSON correctly using CryptoResponse
        if let decodedResponse = try? JSONDecoder().decode(fruityJson.self, from: data) {
            print(decodedResponse)
            print("name in the api: ", winner.name)
            DispatchQueue.main.async {
                self.fruit = decodedResponse
            }

        } else {
            print("Failed to decode JSON")
        }
    } catch {
        print("Network error: \(error.localizedDescription)")
    }
}
}

//do not change this #Preview section. It breaks the preview on xcode.
//Our Profs code is not directly transferable
#Preview {
    fruitfactview()
        .environmentObject(GameWinner())
}
