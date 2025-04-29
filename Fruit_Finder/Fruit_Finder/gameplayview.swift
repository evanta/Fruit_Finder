//
//  gameplayview.swift
//  Fruit_Finder
//
//  Created by Evan Taylor on 4/28/25.
//

import SwiftUI

struct gameplayview: View {
    @State private var fruit1:String = "Banana"
    @State private var fruit2:String = "Blackberry"
    @State private var fruit3:String = "Durian"
    @State private var fruit4:String = "Fig"
    @State private var fruit5:String = "Gooseberry"
    @State private var fruit6:String = "GreenApple"


    var body: some View {
        ZStack{
            Color(.purple)
                .ignoresSafeArea()
            VStack {
                HStack {
                    Image(fruit1)
                        .resizable()
                    
                    Image(fruit2)
                        .resizable()
                } // end HStack
                
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

#Preview {
    gameplayview()
}
