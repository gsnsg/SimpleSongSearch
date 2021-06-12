//
//  HomeView.swift
//  MusicSearch
//
//  Created by Sai Nikhit Gulla on 11/06/21.
//

import Combine
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct HomeView: View {
    
    @StateObject private var viewModel: HomeViewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                SearchTextField() { text in
                    viewModel.loadSongs(forText: text)
                }
                List(viewModel.songs, id: \.id) { song in
                    ListRow(song: song)
                }
                .showLoader($viewModel.isLoading)
                .listStyle(PlainListStyle())
                .navigationTitle("Music Demo")
                .onTapGesture {
                    UIApplication.shared.endEditing()
                }
            }
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
