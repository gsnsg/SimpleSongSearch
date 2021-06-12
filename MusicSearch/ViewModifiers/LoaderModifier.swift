//
//  LoaderModifier.swift
//  MusicSearch
//
//  Created by Sai Nikhit Gulla on 11/06/21.
//

import SwiftUI


extension View {
    
    func showLoader(_ isLoading: Binding<Bool>) -> some View {
        self.modifier(LoaderModifier(isLoading: isLoading))
    }
}

struct LoaderModifier: ViewModifier {
    
    @Binding var isLoading: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if isLoading {
                Color.black.opacity(0.3)
                    .edgesIgnoringSafeArea(.bottom)
                ProgressView()
            }
        }
    }
}
