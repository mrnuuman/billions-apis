//
//  Creater.swift
//  Billions
//
//  Created by Muhammad Nouman on 04/09/2024.
//

import Foundation

public struct Creator: Codable {
    public let id: Int
    public let creditID: String?
    public let name: String?
    public let originalName: String?
    public let gender: Int?
    public let profilePath: String?

    enum CodingKeys: String, CodingKey {
        case id
        case creditID = "credit_id"
        case name
        case originalName = "original_name"
        case gender
        case profilePath = "profile_path"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        creditID = try container.decodeIfPresent(String.self, forKey: .creditID)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        originalName = try container.decodeIfPresent(String.self, forKey: .originalName)
        gender = try container.decodeIfPresent(Int.self, forKey: .gender)
        profilePath = try container.decodeIfPresent(String.self, forKey: .profilePath)
    }
}
