//
//  ContentView.swift
//  CEMarvel assignment
//
//  Created by snlcom on 5/9/24.
//

import SwiftUI
struct ContentView: View {
    let structure: Structure
    var body: some View {
        ScrollView {
            Image(structure.picture)
                .resizable()
                .scaledToFit()
            Text(structure.name)
                .font(.title)
                .bold()
                .multilineTextAlignment(.center)
                .padding(.bottom, 1)
            
            Text(structure.country)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.bottom, 5)
            
            Text(structure.description)
                .padding(.horizontal)
        }
        .navigationTitle("Engineering Marvels")
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView(structure: Structure.exampleStructure)
        }
    }
}
