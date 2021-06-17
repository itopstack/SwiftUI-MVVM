//
//  AnimeCell.swift
//  SwiftUI-MVVM
//
//  Created by Kittisak Phetrungnapha on 17/6/2564 BE.
//

import SwiftUI
import UIKit

struct AnimeCell: View {
    let anime: Anime
    @StateObject var imageLoader = ImageLoader()
    
    var body: some View {
        HStack {
            Image(uiImage: imageLoader.uiImage ?? UIImage(named: "anime_cell_placeholder")!)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .onAppear {
                    imageLoader.fetchImage(urlString: anime.imageURL)
                }
            
            Text(anime.title)
            
            Spacer()
        }
    }
}

struct AnimeCell_Previews: PreviewProvider {
    static var previews: some View {
        AnimeCell(anime: dummyAnime)
            .previewLayout(.sizeThatFits)
            .frame(width: 320, height: 80)
    }
}

let dummyAnime = Anime(title: "86",
                       url: "https://myanimelist.net/anime/41457/86",
                       imageURL: "https://cdn.myanimelist.net/images/anime/1104/113797.jpg?s=ca67432d653a721fa3a5f6770c25bdd6",
                       type: "TV",
                       totalEpisodes: 11,
                       rating: "R")
