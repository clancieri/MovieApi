////
////  MovieViewModel.swift
////  MovieAPI
////
////  Created by Coti on 12/09/2021.
////
//
import Foundation

class MovieViewModel {
    
    var refreshData = {() -> () in}
    
    var results: [Movie] = [] {
        didSet {
            refreshData()
        }
    }
    
    func loadPopularMovies(page: Int) {
        ApiService().getPopularMovies(page: page, completionHandler: {
            movies in
            self.results.append(contentsOf: movies)
        })
    
    }
}
