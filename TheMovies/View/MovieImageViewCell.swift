//
//  MovieImageViewCell.swift
//  TheMovies
//
//  Created by Sergio Maturano on 01/11/2022.
//

import UIKit
import Kingfisher

class MovieImageViewCell: UICollectionViewCell {
    
    static let identifier = "MovieImageViewCell"

    @IBOutlet weak var img: UIImageView?

    var movie: MovieViewModel! = nil {
        didSet {
            let url = URL(string: movie.imageURL)
            let processor = DownsamplingImageProcessor(size: self.contentView.bounds.size)
            img?.layer.cornerRadius = 8.0
            img?.clipsToBounds = true
            img?.contentMode = .scaleAspectFill
            img?.kf.indicatorType = .activity
            img?.kf.setImage(
                with: url,
                placeholder: nil,
                options: [
                    .processor(processor),
                    .scaleFactor(UIScreen.main.scale),
                    .transition(.fade(1)),
                    .cacheOriginalImage
                ])
            {
                result in
                switch result {
                case .success(let value):
                    print("Task done for: \(value.source.url?.absoluteString ?? "")")
                case .failure(let error):
                    print("Job failed: \(error.localizedDescription)")
                }
            }

        }
    }
}
