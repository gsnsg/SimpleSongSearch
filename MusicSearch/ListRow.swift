//
//  ListRow.swift
//  MusicSearch
//
//  Created by Sai Nikhit Gulla on 12/06/21.
//

import Kingfisher
import SwiftUI

struct ListRow: View {
    
    let song: Song
    
    private let imageSize: CGSize = .init(width: 100, height: 100)
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            KFImage(URL(string: song.artistURL))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: imageSize.width, height: imageSize.height, alignment: .center)
                .cornerRadius(5)
            VStack(alignment: .leading, spacing: 10) {
                Text(song.trackName)
                    .font(.system(size: 20, weight: .bold, design: .default))
                Text(song.artistName)
                    .font(.system(size: 20, weight: .medium, design: .default))
            }
        }
    }
}

