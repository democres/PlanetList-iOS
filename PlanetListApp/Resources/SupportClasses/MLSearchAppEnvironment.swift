//
//  PlayfairEnvironment.swift
//  Playfair
//
//  Created by David Figueroa on 16/04/21.
//

import Foundation

enum Config {
    case country
    case url
}

enum CountrySiteId: String {
    case argentina = "MLA"
    case brazil = "MLB"
    case colombia = "MLC"
    case venezuela = "MLV"
}

public class MLSearchAppEnvironment {
    
    public static let shared = MLSearchAppEnvironment()
    var siteId = CountrySiteId.colombia
    
    static func config(attr: Config) -> String {
        guard let config: [String: String] = Bundle.main.infoDictionary!["CONFIG"] as? [String: String] else { return "" }
        
        var attributeValue = ""
        
        switch attr {
        case .url:
            attributeValue = config["API_URL"]!
        case .country:
            attributeValue = "siteId.rawValue"
        }
        
        return attributeValue
    }
}
