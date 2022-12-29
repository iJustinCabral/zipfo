//
//  ZipInformation.swift
//  Zipfo
//
//  Created by Justin Cabral on 12/28/22.
//

import Foundation

struct ZipInformation: Codable, Hashable {
    let postcode: String
    let country: String
    let countryAbbreviation: String
    let places: [Place]
    
    enum CodingKeys: String, CodingKey {
        case postcode = "post code"
        case country = "country"
        case countryAbbreviation = "country abbreviation"
        case places = "places"
        
    }
    
}

struct Place: Codable, Hashable {
    let placeName: String
    let longitude: String
    let state: String
    let stateAbbreviation: String
    let latitude: String
    
    enum CodingKeys: String, CodingKey {
        case placeName = "place name"
        case longitude = "longitude"
        case state = "state"
        case stateAbbreviation = "state abbreviation"
        case latitude = "latitude"
    }
}
