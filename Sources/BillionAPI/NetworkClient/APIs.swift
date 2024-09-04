// APIs.swift
//
//  Created by Muhammad Nouman on 04/09/2024.
//

import Alamofire
import SwiftyJSON
import Foundation

open class APIClient {
    public static var basePath = ""
    public static var apiKey = ""
    public static var apiResponseQueue: DispatchQueue = .main
    
    // Method to create request headers
    public static func configure(basePath: String, apiKey: String) {
        self.basePath = basePath
        self.apiKey = apiKey
    }
    
    public static func defaultHeaders() -> HTTPHeaders {
        return [
            .authorization(bearerToken: apiKey),
            .accept("application/json")
        ]
    }
    
    public static func getTvShowDetails(id: Int, completion: @escaping (Result<TVShow, Error>) -> Void) {
        let endpoint = "/tv/\(id)"
        let requestBuilder = RequestBuilder<TVShow>(method: .get, URLString: endpoint, isBody: false)
        requestBuilder.execute(completion)
    }
    
    public static func getSeasonsDetails(seriesId: Int, SeasonNumber: Int, completion: @escaping (Result<Season, Error>) -> Void) {
        let endpoint = "/tv/\(seriesId)/season/\(SeasonNumber)"
        let requestBuilder = RequestBuilder<Season>(method: .get, URLString: endpoint, isBody: false)
        requestBuilder.execute(completion)
    }
    
    public static func getEpisodeDetails(seriesId: Int, SeasonNumber: Int, episode: Int, completion: @escaping (Result<Episode, Error>) -> Void) {
        let endpoint = "/tv/\(seriesId)/season/\(SeasonNumber)/episode\(episode)"
        let requestBuilder = RequestBuilder<Episode>(method: .get, URLString: endpoint, isBody: false)
        requestBuilder.execute(completion)
    }
}

open class RequestBuilder<T: Decodable> {
    private let method: HTTPMethod
    private let URLString: String
    private let parameters: [String: Any]?
    private let isBody: Bool
    private let headers: HTTPHeaders
    
    public var onProgressReady: ((Progress) -> Void)?
    
    public init(method: HTTPMethod, URLString: String, parameters: [String: Any]? = nil, isBody: Bool, headers: HTTPHeaders = APIClient.defaultHeaders()) {
        self.method = method
        self.URLString = URLString
        self.parameters = parameters
        self.isBody = isBody
        self.headers = headers
    }
    
    open func execute(_ completion: @escaping (Result<T, Error>) -> Void) {
        RequestBuilder<T>.performRequest(method: method, endpoint: URLString, parameters: parameters, headers: headers, completion: completion)
    }
    
    private static func performRequest<T: Decodable>(
        method: HTTPMethod,
        endpoint: String,
        parameters: [String: Any]? = nil,
        headers: HTTPHeaders,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        let url = "\(APIClient.basePath)\(endpoint)?api_key=\(APIClient.apiKey)"
        
        AF.request(url, method: method, parameters: parameters, encoding: method == .get ? URLEncoding.default : JSONEncoding.default, headers: headers)
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    do {
                        let json = JSON(data)
                        let result = try JSONDecoder().decode(T.self, from: json.rawData())
                        APIClient.apiResponseQueue.async {
                            completion(.success(result))
                        }
                    } catch {
                        APIClient.apiResponseQueue.async {
                            completion(.failure(error))
                        }
                    }
                case .failure(let error):
                    APIClient.apiResponseQueue.async {
                        completion(.failure(error))
                    }
                }
            }
    }
}
