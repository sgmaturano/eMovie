//
//  MovieHorizontalListViewCell.swift
//  TheMovies
//
//  Created by Sergio Maturano on 01/11/2022.
//

import UIKit

protocol MovieHorizontalListViewCellDelegate {
    func didSelectMovie(movie: MovieViewModel)
}

class MovieHorizontalListViewCell: UITableViewCell {
    
    class var identifier: String {
        return "MovieHorizontalListViewCell"
    }
    
    @IBOutlet weak var cvMovies: UICollectionView?
    @IBOutlet weak var lblTitle: UILabel?
    @IBOutlet weak var heightCollectionView: NSLayoutConstraint?
    
    var delegate: MovieHorizontalListViewCellDelegate?

    var section: MovieSection! = .topRate {
        didSet {
            self.titleSection = section.rawValue
            self.arrData = CoreDataManager.shared.getMovieBy(section: section)
        }
    }
    
    private var arrData = [MovieViewModel]() {
        didSet {
            self.reloadDataMovie()
        }
    }
    
    private var titleSection: String = "" {
        didSet {
            self.lblTitle?.text = titleSection.localized
        }
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func reloadDataMovie() {
        self.heightCollectionView?.constant = Constant.sizeMoviewImage.height
        self.cvMovies?.reloadData()
    }
}

extension MovieHorizontalListViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieImageViewCell.identifier, for: indexPath) as! MovieImageViewCell
        cell.movie = arrData[indexPath.row]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return Constant.sizeMoviewImage
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = arrData[indexPath.row]
        delegate?.didSelectMovie(movie: movie)
    }

}
