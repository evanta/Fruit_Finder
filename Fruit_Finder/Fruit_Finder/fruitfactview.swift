//
//  fruitfactview.swift
//  Fruit_Finder
//
//  Created by Evan Taylor on 4/28/25.
//

import SwiftUI
import Foundation
/*
 "name": "Persimmon",
   "id": 52,
   "family": "Ebenaceae",
   "order": "Rosales",
   "genus": "Diospyros",
   "nutritions": {
     "calories": 81,
     "fat": 0,
     "sugar": 18,
     "carbohydrates": 18,
     "protein": 0
 */

struct fruity: Decodable {
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
    @State private var fruitimage = "Banana"
    @State private var fruittext = "this is a banana."
    @State private var fruit: fruity?
    @State private var fruitName = "Blackberry"
    
    var body: some View {
        ZStack {
            Color(.purple)
                .ignoresSafeArea()
            
            VStack {
                Image(fruitimage)
                    .resizable()
                    .padding()
                Text(fruit.map {
                    """
                    Name: \($0.name)
                    Family: \($0.family)
                    Genus: \($0.genus)
                    Order: \($0.order)
                    
                    Nutrition:
                    - Calories: \($0.nutritions.calories)
                    - Fat: \($0.nutritions.fat)
                    - Sugar: \($0.nutritions.sugar)
                    - Carbohydrates: \($0.nutritions.carbohydrates)
                    - Protein: \($0.nutritions.protein)
                    """
                } ?? "loading...")                    .frame(width: 275, height: 480, alignment: .center)
                    .background(Color.white)
                    .foregroundColor(Color.black)
                    .font(.custom("helvetica", size: 12))
            }
            .task {
                await fetchCryptoData()
            }

        }
    }

func fetchCryptoData() async {
    // Corrected URL with "https://"
    guard let url = URL(string: "https://www.fruityvice.com/api/fruit/\(fruitName)") else {
        print("Invalid URL")
        return
    }

    do {
        let (data, _) = try await URLSession.shared.data(from: url)

        // Decode JSON correctly using CryptoResponse
        if let decodedResponse = try? JSONDecoder().decode(fruity.self, from: data) {
            print(decodedResponse)
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

#Preview {
    fruitfactview()
}
