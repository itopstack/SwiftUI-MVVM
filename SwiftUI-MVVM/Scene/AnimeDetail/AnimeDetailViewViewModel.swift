//
//  AnimeDetailViewViewModel.swift
//  SwiftUI-MVVM
//
//  Created by Kittisak Phetrungnapha on 17/6/2564 BE.
//

import Foundation
import UIKit

final class AnimeDetailViewViewModel: ObservableObject {
    @Published var animeImage: UIImage?
    
    private let anime: Anime
    private let imageLoader: ImageLoader
    
    var animeTitle: String {
        "Title: \(anime.title)"
    }
    
    var animeType: String {
        "Type: \(anime.type)"
    }
    
    var animeTotalEpisodes: String {
        "Total episodes: \(anime.totalEpisodes)"
    }
    
    var animeRating: String {
        "Rating: \(anime.rating)"
    }
    
    var animeLink: URL {
        URL(string: anime.url)!
    }
    
    init(anime: Anime, imageLoader: ImageLoader = ImageLoader()) {
        self.anime = anime
        self.imageLoader = imageLoader
    }
    
    func fetchAnimeImage() {
        imageLoader.fetchImage(urlString: anime.imageURL) { [weak self] image in
            self?.animeImage = image
        }
    }
}
