//
//  Planet.swift
//  PlanetListApp
//
//  Created by David Figueroa on 26/11/21.
//

import Foundation

struct GETPlanetsWrapper: Codable {
    var results: [Planet]
}

struct Planet: Codable, Identifiable {
    var id = UUID()
    var name: String
    var population: String
    
    public enum CodingKeys: String, CodingKey, CaseIterable {
        case name
        case population
    }
}
