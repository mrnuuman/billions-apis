//
//  Production.swift
//  Billions
//
//  Created by Muhammad Nouman on 04/09/2024.
//

import Foundation

public struct ProductionCompany: Codable {
    public let id: Int
    public let logoPath: String?
    public let name: String?
    public let originCountry: String?

    enum CodingKeys: String, CodingKey {
        case id
        case logoPath = "logo_path"
        case name
        case originCountry = "origin_country"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        logoPath = try container.decodeIfPresent(String.self, forKey: .logoPath)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        originCountry = try container.decodeIfPresent(String.self, forKey: .originCountry)
    }
}

public struct ProductionCountry: Codable {
    let iso3166_1: String?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case iso3166_1 = "iso_3166_1"
        case name
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        iso3166_1 = try container.decodeIfPresent(String.self, forKey: .iso3166_1)
        name = try container.decodeIfPresent(String.self, forKey: .name)
    }
}
