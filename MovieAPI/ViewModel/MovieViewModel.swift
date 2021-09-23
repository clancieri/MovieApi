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
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(at section: Int) -> Int {
        return results.count
    }
    
    func item(at indexPath: IndexPath) -> Movie {
        return results[indexPath.row]
    }
    
    func heightForRow(at indexPath: IndexPath) -> Int {
        return 170
    }
}
