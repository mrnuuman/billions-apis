//
//  Episode.swift
//  Billions
//
//  Created by Muhammad Nouman on 04/09/2024.
//

import Foundation

public struct Episode: Codable, Identifiable {
    public let id: Int
    public let name: String?
    public let overview: String?
    public let voteAverage: Double?
    public let voteCount: Int?
    public let airDate: String?
    public let episodeNumber: Int?
    public let episodeType: String?
    public let productionCode: String?
    public let runtime: Int?
    public let seasonNumber: Int?
    public let showID: Int?
    public let stillPath: String?
    public let crew: [CrewMember]?
    public let guestStars: [GuestStar]?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case overview
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case airDate = "air_date"
        case episodeNumber = "episode_number"
        case episodeType = "episode_type"
        case productionCode = "production_code"
        case runtime
        case seasonNumber = "season_number"
        case showID = "show_id"
        case stillPath = "still_path"
        case crew
        case guestStars = "guest_stars"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        overview = try container.decodeIfPresent(String.self, forKey: .overview)
        voteAverage = try container.decodeIfPresent(Double.self, forKey: .voteAverage)
        voteCount = try container.decodeIfPresent(Int.self, forKey: .voteCount)
        airDate = try container.decodeIfPresent(String.self, forKey: .airDate)
        episodeNumber = try container.decodeIfPresent(Int.self, forKey: .episodeNumber)
        episodeType = try container.decodeIfPresent(String.self, forKey: .episodeType)
        productionCode = try container.decodeIfPresent(String.self, forKey: .productionCode)
        runtime = try container.decodeIfPresent(Int.self, forKey: .runtime)
        seasonNumber = try container.decodeIfPresent(Int.self, forKey: .seasonNumber)
        showID = try container.decodeIfPresent(Int.self, forKey: .showID)
        stillPath = try container.decodeIfPresent(String.self, forKey: .stillPath)
        crew = try? container.decodeIfPresent([CrewMember].self, forKey: .crew)
        guestStars = try? container.decodeIfPresent([GuestStar].self, forKey: .guestStars)
    }
}
