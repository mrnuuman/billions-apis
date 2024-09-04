//
//  TVShow.swift
//  Billions
//
//  Created by Muhammad Nouman on 04/09/2024.
//

import Foundation

public struct TVShow: Codable {
    public let adult: Bool
    public let backdropPath: String?
    public let createdBy: [Creator]?
    public let episodeRunTime: [Int]?
    public let firstAirDate: String?
    public let genres: [Genre]?
    public let homepage: String?
    public let id: Int
    public let inProduction: Bool
    public let languages: [String]?
    public let lastAirDate: String?
    public let lastEpisodeToAir: Episode?
    public let name: String?
    public let nextEpisodeToAir: Episode?
    public let networks: [Network]?
    public let numberOfEpisodes: Int?
    public let numberOfSeasons: Int?
    public let originCountry: [String]?
    public let originalLanguage: String?
    public let originalName: String?
    public let overview: String?
    public let popularity: Double?
    public let posterPath: String?
    public let productionCompanies: [ProductionCompany]?
    public let productionCountries: [ProductionCountry]?
    public let seasons: [Season]?
    public let spokenLanguages: [SpokenLanguage]?
    public let status: String?
    public let tagline: String?
    public let type: String?
    public let voteAverage: Double?
    public let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case createdBy = "created_by"
        case episodeRunTime = "episode_run_time"
        case firstAirDate = "first_air_date"
        case genres
        case homepage
        case id
        case inProduction = "in_production"
        case languages
        case lastAirDate = "last_air_date"
        case lastEpisodeToAir = "last_episode_to_air"
        case name
        case nextEpisodeToAir = "next_episode_to_air"
        case networks
        case numberOfEpisodes = "number_of_episodes"
        case numberOfSeasons = "number_of_seasons"
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview
        case popularity
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case seasons
        case spokenLanguages = "spoken_languages"
        case status
        case tagline
        case type
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        adult = try container.decode(Bool.self, forKey: .adult)
        backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath)
        createdBy = try container.decodeIfPresent([Creator].self, forKey: .createdBy)
        episodeRunTime = try container.decodeIfPresent([Int].self, forKey: .episodeRunTime)
        firstAirDate = try container.decodeIfPresent(String.self, forKey: .firstAirDate)
        genres = try container.decodeIfPresent([Genre].self, forKey: .genres)
        homepage = try container.decodeIfPresent(String.self, forKey: .homepage)
        id = try container.decode(Int.self, forKey: .id)
        inProduction = try container.decode(Bool.self, forKey: .inProduction)
        languages = try container.decodeIfPresent([String].self, forKey: .languages)
        lastAirDate = try container.decodeIfPresent(String.self, forKey: .lastAirDate)
        lastEpisodeToAir = try container.decodeIfPresent(Episode.self, forKey: .lastEpisodeToAir)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        nextEpisodeToAir = try container.decodeIfPresent(Episode.self, forKey: .nextEpisodeToAir)
        networks = try container.decodeIfPresent([Network].self, forKey: .networks)
        numberOfEpisodes = try container.decodeIfPresent(Int.self, forKey: .numberOfEpisodes)
        numberOfSeasons = try container.decodeIfPresent(Int.self, forKey: .numberOfSeasons)
        originCountry = try container.decodeIfPresent([String].self, forKey: .originCountry)
        originalLanguage = try container.decodeIfPresent(String.self, forKey: .originalLanguage)
        originalName = try container.decodeIfPresent(String.self, forKey: .originalName)
        overview = try container.decodeIfPresent(String.self, forKey: .overview)
        popularity = try container.decodeIfPresent(Double.self, forKey: .popularity)
        posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath)
        productionCompanies = try container.decodeIfPresent([ProductionCompany].self, forKey: .productionCompanies)
        productionCountries = try container.decodeIfPresent([ProductionCountry].self, forKey: .productionCountries)
        seasons = try container.decodeIfPresent([Season].self, forKey: .seasons)
        spokenLanguages = try container.decodeIfPresent([SpokenLanguage].self, forKey: .spokenLanguages)
        status = try container.decodeIfPresent(String.self, forKey: .status)
        tagline = try container.decodeIfPresent(String.self, forKey: .tagline)
        type = try container.decodeIfPresent(String.self, forKey: .type)
        voteAverage = try container.decodeIfPresent(Double.self, forKey: .voteAverage)
        voteCount = try container.decodeIfPresent(Int.self, forKey: .voteCount)
    }
}
