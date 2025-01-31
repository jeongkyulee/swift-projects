//
//  Structure.swift
//  CEMarvel assignment
//
//  Created by snlcom on 5/9/24.
//

import Foundation

struct Structure: Decodable, Identifiable, Hashable {
    let id: Int
    let name: String
    let country: String
    let description: String
    let latitude: Double
    let longitude: Double
    let picture: String
    
    static let exampleStructure = Structure(id: 1, name: "Golden Gate Bridge", country: "usa", description: "Opened as a San Francisco landmark on May 27, 1937, it is 2,737 m long, 67 m apart from the bridge and water, and 227 m tall in total with the tower, it was constructed as the world's first suspension bridge connecting San Francisco Bay and Marine County. It was first designed in 1917 by Joseph Strauss, who had previously designed about 400 bridges, and it proceeded with a project to overcome the difficult economy during the Great Depression.", latitude: 37.820385, longitude: -122.479064, picture: "Golden Gate Bridge")
}
