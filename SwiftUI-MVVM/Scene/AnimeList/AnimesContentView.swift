//
//  AnimesContentView.swift
//  SwiftUI-MVVM
//
//  Created by Kittisak Phetrungnapha on 17/6/2564 BE.
//

import SwiftUI

struct AnimesContentView: View {
    @StateObject var viewModel: AnimesContentViewViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.animes) { anime in
                let animeDetailViewModel = AnimeDetailViewViewModel(anime: anime)
                
                NavigationLink(destination: AnimeDetailView(viewModel: animeDetailViewModel)) {
                    AnimeCell(anime: anime)
                }
            }
            .alert(isPresented: $viewModel.needToShowAlert) {
                Alert(title: Text(viewModel.errorMessage))
            }
            .navigationTitle("Animes")
            .onAppear {
                viewModel.fetchAnimes()
            }
        }
    }
}

struct AnimesContentView_Previews: PreviewProvider {
    static var previews: some View {
        AnimesContentView(viewModel: AnimesContentViewViewModel())
    }
}
