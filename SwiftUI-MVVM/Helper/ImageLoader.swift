//
//  ImageLoader.swift
//  SwiftUI-MVVM
//
//  Created by Kittisak Phetrungnapha on 17/6/2564 BE.
//

import Foundation
import Combine
import UIKit

final class ImageLoader: ObservableObject {
    @Published var uiImage: UIImage?
    
    private let session: URLSession
    private var cancellable: AnyCancellable?
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func fetchImage(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        cancellable = session.dataTaskPublisher(for: url)
            .map { $0.data }
            .replaceError(with: Data())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
            .sink(receiveValue: { data in
                self.uiImage = UIImage(data: data)
            })
    }
}
