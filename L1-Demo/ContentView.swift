//
//  ContentView.swift
//  L1-Demo
//
//  Created by Aarav Gupta on 20/06/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            // Blurred background image with a color overlay
            Image("bg")
                .resizable() // Ensure the image fills the entire background
                .ignoresSafeArea()
                .blur(radius: 5, opaque: true)
                .overlay(Color.black.opacity(0.2)) // Add a color overlay to reduce whiteness
            
            VStack {
                // In-focus image on top of the blurred background
                Image("bg")
                    .resizable()
                    .cornerRadius(15)
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal, 30.0)
                
                // Text underneath the in-focus image
                Text("Click on the sun")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white) // Set the text color to white
                    .padding(.top, 10) // Add some padding at the top
            }
        }
    }
}

#Preview {
    ContentView()
}
