//
//  AnimeMetaData.swift
//  SwiftUI-MVVM
//
//  Created by Kittisak Phetrungnapha on 17/6/2564 BE.
//

import Foundation

struct AnimeMetaData: Codable {
    let requestHash: String
    let requestCached: Bool
    let requestCacheExpiry: Int
    let animes: [Anime]
    
    private enum CodingKeys: String, CodingKey {
        case requestHash = "request_hash"
        case requestCached = "request_cached"
        case requestCacheExpiry = "request_cache_expiry"
        case animes = "anime"
    }
}
