//
//  GuestStar.swift
//  Billions
//
//  Created by Muhammad Nouman on 04/09/2024.
//

import Foundation

public struct GuestStar: Codable {
    public let character: String?
    public let creditId: String?
    public let order: Int?
    public let adult: Bool?
    public let gender: Int?
    public let id: Int?
    public let knownForDepartment: String?
    public let name: String?
    public let originalName: String?
    public let popularity: Double?
    public let profilePath: String?
    
    enum CodingKeys: String, CodingKey {
        case character
        case creditId = "credit_id"
        case order
        case adult
        case gender
        case id
        case knownForDepartment = "known_for_department"
        case name
        case originalName = "original_name"
        case popularity
        case profilePath = "profile_path"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        character = try? container.decodeIfPresent(String.self, forKey: .character)
        creditId = try? container.decodeIfPresent(String.self, forKey: .creditId)
        order = try? container.decodeIfPresent(Int.self, forKey: .order)
        adult = try? container.decodeIfPresent(Bool.self, forKey: .adult)
        gender = try? container.decodeIfPresent(Int.self, forKey: .gender)
        id = try? container.decodeIfPresent(Int.self, forKey: .id)
        knownForDepartment = try? container.decodeIfPresent(String.self, forKey: .knownForDepartment)
        name = try? container.decodeIfPresent(String.self, forKey: .name)
        originalName = try? container.decodeIfPresent(String.self, forKey: .originalName)
        popularity = try? container.decodeIfPresent(Double.self, forKey: .popularity)
        profilePath = try? container.decodeIfPresent(String.self, forKey: .profilePath)
    }
}
