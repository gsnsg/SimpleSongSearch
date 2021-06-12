//
//  SongManager.swift
//  MusicSearch
//
//  Created by Sai Nikhit Gulla on 11/06/21.
//

import Combine
import SwiftUI


enum NetworkError: Error {
    case error(Error)
    case badURL
    case decodingError
    case badInput
}

final class SongManager {
    
    static let decoder = JSONDecoder()
    
    private func buildURL(forQuery query: String, endpoint: Endpoint) -> URL? {
        let queryItems = [
            URLQueryItem(name: "term", value: query)
        ]
        var components = URLComponents(string: endpoint.baseURLString)
        components?.queryItems = queryItems
        return components?.url
    }
    
    func getSearchPublisher(forQuery query: String) -> AnyPublisher<SongResponse, NetworkError> {
        guard let url = buildURL(forQuery: query, endpoint: .search) else {
            return Fail(outputType: SongResponse.self, failure: NetworkError.badURL)
                .eraseToAnyPublisher()
            
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: SongResponse.self, decoder: Self.decoder)
            .mapError { error in
                if error is DecodingError {
                    return NetworkError.decodingError
                }
                return NetworkError.error(error)
            }
            .eraseToAnyPublisher()
    }
}

extension SongManager {
    
    enum Endpoint {
        case search
        
        var baseURLString: String{
            switch self {
            case .search:
                return "https://itunes.apple.com/search"
            }
        }
    }
}
