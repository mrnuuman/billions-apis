//
//  Network.swift
//  Billions
//
//  Created by Muhammad Nouman on 04/09/2024.
//

import Foundation

public struct Network: Codable {
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

public struct Genre: Codable {
    public let id: Int
    public let name: String?

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decodeIfPresent(String.self, forKey: .name)
    }
}

public struct SpokenLanguage: Codable {
    public let englishName: String?
    public let iso639_1: String?
    public let name: String?

    enum CodingKeys: String, CodingKey {
        case englishName = "english_name"
        case iso639_1 = "iso_639_1"
        case name
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        englishName = try container.decodeIfPresent(String.self, forKey: .englishName)
        iso639_1 = try container.decodeIfPresent(String.self, forKey: .iso639_1)
        name = try container.decodeIfPresent(String.self, forKey: .name)
    }
}
