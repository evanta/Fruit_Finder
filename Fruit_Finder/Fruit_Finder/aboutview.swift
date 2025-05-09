//
//  aboutview.swift
//  Fruit_Finder
//
//  Created by Evan Taylor on 4/28/25.
//

import SwiftUI

struct aboutview: View {
    var body: some View {
        ZStack{
            
            Image("BackGround")
                .resizable()
                .ignoresSafeArea()
            
            Text("This project was done by Evan Taylor and Jeremiah Perez-Mendez")
        }
    }
}

struct aboutview_Previews: PreviewProvider {
    static var previews: some View {
        aboutview()
    }
}
