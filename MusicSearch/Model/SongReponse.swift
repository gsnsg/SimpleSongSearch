//
//  SongReponse.swift
//  MusicSearch
//
//  Created by Sai Nikhit Gulla on 11/06/21.
//

import Foundation


struct SongResponse: Decodable {
    
    let songs: [Song]
    
    enum CodingKeys: String, CodingKey {
        case songs = "results"
    }
}

struct Song: Decodable {
    
    let id: Int
    let trackName: String
    let artistName: String
    let artistURL: String
    
    enum CodingKeys: String, CodingKey {
        case id = "trackId"
        case trackName
        case artistName
        case artistURL = "artworkUrl60"
    }
}
