//
//  Structures.swift
//  CEMarvel assignment
//
//  Created by snlcom on 5/9/24.
//

import Foundation

class Structures: ObservableObject {
    let structures: [Structure]
    init() {
        if let url = Bundle.main.url(forResource: "structures", withExtension: "json"),
           let data = try? Data(contentsOf: url){
            if let structuresCheck = try? JSONDecoder().decode([Structure].self, from: data) {
                self.structures = structuresCheck
            } else {
                self.structures = [Structure.exampleStructure]
            }
        } else {
            self.structures = [Structure.exampleStructure]
        }
    }
}
