//
//  leaderboardview.swift
//  Fruit_Finder
//
//  Created by Evan Taylor on 4/28/25.
//

import SwiftUI

struct Customers: Decodable {
    var id:         String
    var name:       String
    var address:    String
    var city:       String
    var state:      String
    var zip:        String
}

struct leaderboardview: View {
    @State private var customers = [Customers]()
    
    var body: some View {
        NavigationView {
            List(customers, id: \.id) { t in
                VStack (alignment: .leading) {
                    Text(String(t.id))
                        .font(.headline)
                        .foregroundColor(.cyan)
                    Text(t.name)
                        .font(.body)
                        .foregroundColor(.indigo)
                    Text(String(t.address))
                        .font(.body)
                        .foregroundColor(.red)
                    Text(String(t.city))
                        .font(.body)
                        .foregroundColor(.purple)
                    Text(String(t.state))
                        .font(.body)
                        .foregroundColor(.blue)
                    Text(String(t.zip))
                        .font(.body)
                        .foregroundColor(.pink)
                }
            }
            .navigationTitle("All Customers")
            .task {
                await fetchAllCustomers()
            }
        }
    }
    
    func fetchAllCustomers() async {
        // create the URL
        guard let url = URL(string: "https://www.dsm.fordham.edu/~jperezmendez/cgi-bin/InfoJSONConvert.py") else {
            print("Hey Man, THIS URL DOES NOT WORK!")
            return
        }
        
        // fetch the data
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // decode that data
            if let decodedResponse = try? JSONDecoder().decode([Customers].self, from: data) {
                customers = decodedResponse
            }
        } catch {
            print("Bad news ... This data is not valid :-(")
        }
        
        // ecode the data
    }
}


struct leaderboardview_Previews: PreviewProvider {
    static var previews: some View {
        leaderboardview()
    }
}
