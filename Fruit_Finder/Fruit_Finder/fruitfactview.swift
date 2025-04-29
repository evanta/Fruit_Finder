//
//  fruitfactview.swift
//  Fruit_Finder
//
//  Created by Evan Taylor on 4/28/25.
//

import SwiftUI

struct fruitfactview: View {
    @State private var fruitimage = "Banana"
    
    var body: some View {
        ZStack {
            Color(.purple)
                .ignoresSafeArea()
            
            VStack {
                Image(fruitimage)
                    .resizable()
            }
        }
    }
}

#Preview {
    fruitfactview()
}
