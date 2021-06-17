//
//  AnimesContentViewViewModel.swift
//  SwiftUI-MVVM
//
//  Created by Kittisak Phetrungnapha on 17/6/2564 BE.
//

import Foundation
import Combine

final class AnimesContentViewViewModel: ObservableObject {
    @Published var animes: [Anime] = []
    @Published var error: Error?
    
    private let session: URLSession
    private let decoder: JSONDecoder
    private var cancellable: AnyCancellable?
    
    init(session: URLSession = .shared, decoder: JSONDecoder = JSONDecoder()) {
        self.session = session
        self.decoder = decoder
    }
    
    func fetchAnimes() {
        let animesURL = URL(string: "https://api.jikan.moe/v3/user/Nekomata1037/animelist/all")!
        decoder.dateDecodingStrategy = .iso8601
        
        cancellable = session.dataTaskPublisher(for: animesURL)
            .tryMap { output in
                guard let response = output.response as? HTTPURLResponse, response.statusCode == 200 else {
                    throw HTTPError.statusCode
                }
                return output.data
            }
            .decode(type: AnimeMetaData.self, decoder: decoder)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.error = error
                }
            }, receiveValue: { animeMetaData in
                self.animes = animeMetaData.animes
            })
    }
}
