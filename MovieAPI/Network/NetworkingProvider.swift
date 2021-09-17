//
//  NetworkingProvider.swift
//  MovieAPI
//
//  Created by Coti on 12/09/2021.
//

import Foundation
import Alamofire

final class ApiService {
    
     func getPopularMovies(page: Int, completionHandler: @escaping ([Movie]) -> Void) {
        let url = "https://api.themoviedb.org/3/movie/popular?api_key=176de15e8c8523a92ff640f432966c9c"
        let request = AF.request("\(url)&language=en-US&page=\(page)")
        request.responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let page = try JSONDecoder().decode(MoviesPage.self, from: data)
                    completionHandler(page.results)
                } catch let error {
                    print("Error: \(error)")
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}

