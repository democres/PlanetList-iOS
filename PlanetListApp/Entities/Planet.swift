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

struct Planet: Codable {
    var name: String
    var population: String
}
