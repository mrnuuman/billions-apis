//
//  CrewMember.swift
//  Billions
//
//  Created by Muhammad Nouman on 04/09/2024.
//

import Foundation

public struct CrewMember: Codable {
    public let job: String?
    public let department: String?
    public let creditId: String?
    public let adult: Bool?
    public let gender: Int?
    public let id: Int?
    public let knownForDepartment: String?
    public let name: String?
    public let originalName: String?
    public let popularity: Double?
    public let profilePath: String?
    
    enum CodingKeys: String, CodingKey {
        case job
        case department
        case creditId = "credit_id"
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
        job = try? container.decodeIfPresent(String.self, forKey: .job)
        department = try? container.decodeIfPresent(String.self, forKey: .department)
        creditId = try? container.decodeIfPresent(String.self, forKey: .creditId)
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
