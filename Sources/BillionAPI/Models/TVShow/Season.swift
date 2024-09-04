//
//  Season.swift
//  Billions
//
//  Created by Muhammad Nouman on 04/09/2024.
//

import Foundation

public struct Season: Codable {
    public let airDate: String?
    public let episodeCount: Int?
    public let id: Int
    public let name: String?
    public let overview: String?
    public let posterPath: String?
    public let seasonNumber: Int?
    public let voteAverage: Double?
    public let episodes: [Episode]?

    enum CodingKeys: String, CodingKey {
        case airDate = "air_date"
        case episodeCount = "episode_count"
        case id
        case name
        case overview
        case posterPath = "poster_path"
        case seasonNumber = "season_number"
        case voteAverage = "vote_average"
        case episodes
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        airDate = try container.decodeIfPresent(String.self, forKey: .airDate)
        episodeCount = try container.decodeIfPresent(Int.self, forKey: .episodeCount)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        overview = try container.decodeIfPresent(String.self, forKey: .overview)
        posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath)
        seasonNumber = try container.decodeIfPresent(Int.self, forKey: .seasonNumber)
        voteAverage = try container.decodeIfPresent(Double.self, forKey: .voteAverage)
        episodes = try? container.decodeIfPresent([Episode].self, forKey: .episodes)
    }
}
