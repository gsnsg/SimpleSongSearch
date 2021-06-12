//
//  SearchTextField.swift
//  MusicSearch
//
//  Created by Sai Nikhit Gulla on 12/06/21.
//

import SwiftUI

struct SearchTextField: UIViewRepresentable {
    
    
    var searchAction: (String) -> Void
   
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(action: searchAction)
    }
    
    class Coordinator: NSObject, UISearchBarDelegate {
        
        var searchAction: (String) -> Void
        
        init(action: @escaping (String) -> Void) {
            self.searchAction = action
        }
        
        func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
            searchBar.showsCancelButton = true
        }
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchAction(searchBar.text ?? "")
            searchBar.showsCancelButton = false
            searchBar.resignFirstResponder()
        }
        
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searchAction(searchBar.text ?? "")
            searchBar.showsCancelButton = false
            searchBar.resignFirstResponder()
        }
    }
}
