//
//  fruitfactview.swift
//  Fruit_Finder
//
//  Created by Evan Taylor on 4/28/25.
//

import SwiftUI

struct fruitfactview: View {
    @State private var fruitimage = "Banana"
    @State private var fruittext = "this is a banana."
    
    var body: some View {
        ZStack {
            Color(.purple)
                .ignoresSafeArea()
            
            VStack {
                Image(fruitimage)
                    .resizable()
                    .padding()
                Text(fruittext)
                    .frame(width: 275, height: 70, alignment: .center)
                    .background(Color.white)
                    .foregroundColor(Color.black)
                    .font(.custom("helvetica", size: 12))
            }
        }
    }
}

#Preview {
    fruitfactview()
}
