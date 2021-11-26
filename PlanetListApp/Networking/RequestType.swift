//
//  RequestType.swift
//  PlanetListApp
//
//  Created by David Figueroa on 26/11/21.
//

import Foundation

enum RequestType {
    case getPlanets
}

extension RequestType: APIRequest {
    
    var scheme: String {
        switch self {
        default:
            return "https"
        }
    }
    
    var baseURL: String {
        switch self {
        default:
            return "swapi.dev"
        }
    }
    
    var path: String {
        switch self {
        case .getPlanets:
            return "/api/planets/"
        }
    }
    
    var parameters: [URLQueryItem]? {
        switch self {
        default:
            return nil
        }
    }
    
    var method: String {
        switch self {
        default:
            return "GET"
        }
    }
    
    var absoluteString: String {
        switch self {
        default:
            return self.scheme + "://" + self.baseURL + self.path
        }
    }
}
