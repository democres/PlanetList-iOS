//
//  APIRequest.swift
//  PlanetListApp
//
//  Created by David Figueroa on 26/11/21.
//

import Foundation

protocol APIRequest {
    var scheme: String { get }
    var baseURL: String { get }
    var path: String { get }
    var parameters: [URLQueryItem]? { get }
    var method: String { get }
    var absoluteString: String { get }
}
