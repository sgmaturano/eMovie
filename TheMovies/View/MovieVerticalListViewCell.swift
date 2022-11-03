//
//  MovieVerticalListViewCell.swift
//  TheMovies
//
//  Created by Sergio Maturano on 03/11/2022.
//

import UIKit

class MovieVerticalListViewCell: MovieHorizontalListViewCell {
    
    override class var identifier: String {
        return "MovieVerticalListViewCell"
    }
            
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func reloadDataMovie() {
        let rows = Int(Double(Constant.numberItemsRecommed) * 0.5)
        let margin = 20.0 * (Double(rows) - 1.0)
        self.heightCollectionView?.constant = (Constant.sizeMoviewImage.height * Double(rows)) + margin
        self.cvMovies?.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.size.width - 20.0) * 0.5
        return CGSize(width: width, height: Constant.sizeMoviewImage.height)
    }
    
}
