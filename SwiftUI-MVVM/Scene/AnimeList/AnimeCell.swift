//
//  AnimeCell.swift
//  SwiftUI-MVVM
//
//  Created by Kittisak Phetrungnapha on 17/6/2564 BE.
//

import SwiftUI

struct AnimeCell: View {
    let anime: Anime
    
    var body: some View {
        HStack {
            Image("anime_placeholder")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
            
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
                       imageURL: URL(string: "https://cdn.myanimelist.net/images/anime/1104/113797.jpg?s=ca67432d653a721fa3a5f6770c25bdd6")!,
                       url: "https://myanimelist.net/anime/41457/86",
                       type: "TV",
                       totalEpisodes: 11,
                       seasonName: "Spring",
                       seasonYear: 2021,
                       rating: "R",
                       startDate: Date(),
                       endDate: Date())