//
//  MovieTableViewCell.swift
//  MovieAPI
//
//  Created by Coti on 14/09/2021.
//

import UIKit
import Kingfisher

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var moviePoster: UIImageView!
    
    @IBOutlet weak var movieDate: UILabel!
    
    @IBOutlet weak var movieVote: UILabel!
    
    let baseUrlImage = "https://image.tmdb.org/t/p/w300"
    
    override func prepareForReuse() {
        super.prepareForReuse()
        moviePoster.image = nil
        moviePoster.kf.cancelDownloadTask()
    }
    
    func configure(for result: Movie) {
        movieTitle.text = result.title
        movieDate.text = result.year
        guard let rate = result.voteAverage else {return}
        movieVote.text = String(rate)
        let resultImage = result.imageUrl!
        if let imageUrl = URL(string: baseUrlImage + resultImage){
            moviePoster.kf.setImage(with: imageUrl)
        }        
    }
}
