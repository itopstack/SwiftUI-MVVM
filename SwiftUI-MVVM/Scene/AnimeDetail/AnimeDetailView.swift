//
//  AnimeDetailView.swift
//  SwiftUI-MVVM
//
//  Created by Kittisak Phetrungnapha on 17/6/2564 BE.
//

import SwiftUI

struct AnimeDetailView: View {
    @StateObject var viewModel: AnimeDetailViewViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Image(uiImage: viewModel.animeImage ?? UIImage(named: "anime_detail_placeholder")!)
                .resizable()
                .scaledToFit()
                .frame(width: 375, height: 250)
                .onAppear {
                    viewModel.fetchAnimeImage()
                }
            
            Text(viewModel.animeTitle)
            
            HStack {
                Spacer()
                    .frame(width: 10)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(viewModel.animeType)
                    Text(viewModel.animeTotalEpisodes)
                    Text(viewModel.animeRating)
                    
                    Link("Link", destination: viewModel.animeLink)
                }
                
                Spacer()
            }
            
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AnimeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AnimeDetailView(viewModel: AnimeDetailViewViewModel(anime: dummyAnime))
    }
}
