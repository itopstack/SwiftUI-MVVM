//
//  Anime.swift
//  SwiftUI-MVVM
//
//  Created by Kittisak Phetrungnapha on 17/6/2564 BE.
//

import Foundation

struct Anime: Codable, Identifiable {
    var id = UUID()
    
    let title: String
    let url: String
    let imageURL: String
    let type: String
    let totalEpisodes: Int
    let rating: String
    
    private enum CodingKeys: String, CodingKey {
        case title
        case url
        case imageURL = "image_url"
        case type
        case totalEpisodes = "total_episodes"
        case rating
    }
}
