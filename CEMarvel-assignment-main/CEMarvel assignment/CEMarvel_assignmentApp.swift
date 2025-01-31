//
//  CEMarvel_assignmentApp.swift
//  CEMarvel assignment
//
//  Created by snlcom on 5/9/24.
//

import SwiftUI

@main
struct CEMarvel01App: App {
    @StateObject var structures = Structures()
    var body: some Scene {
        WindowGroup {
            TabView {
                ScrollView {
                    ForEach(structures.structures, id: \.self) { structure in
                        ContentView(structure: structure)
                        Divider()
                    }
                }
                .padding(.top, 1)
                .tabItem {
                    Image(systemName: "text.bubble")
                    Text("Engineering Marvels")
                }
                NavigationView {
                    MapView()
                }
                .tabItem {
                    Image(systemName: "globe")
                    Text("Global Map")
                }
            }
            .environmentObject(structures)
        }
    }
}
