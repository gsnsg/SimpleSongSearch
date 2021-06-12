//
//  HomeViewModel.swift
//  MusicSearch
//
//  Created by Sai Nikhit Gulla on 11/06/21.
//

import Combine
import SwiftUI

final class HomeViewModel: ObservableObject {
    
    @Published private(set) var songs: [Song] = []
    
    @Published var isLoading: Bool = false
    
    private var susbcription: AnyCancellable?
    
    private var songManager: SongManager = SongManager()
    
    func loadSongs(forText text: String) {
        guard text.count > 0 else { return }
        self.isLoading = true
        susbcription = songManager.getSearchPublisher(forQuery: text)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion  in
                self?.isLoading = false
                switch completion {
                case .finished:
                    print("Finished!")
                case .failure(let error):
                    print("Failed with error:", error)
                }
            }, receiveValue: { [weak self] response in
                self?.isLoading = false
                self?.songs = response.songs
            })
    }
}
