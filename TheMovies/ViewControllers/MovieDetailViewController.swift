//
//  MovieDetailViewController.swift
//  TheMovies
//
//  Created by Sergio Maturano on 02/11/2022.
//

import UIKit
import Kingfisher
import AVKit

class MovieDetailViewController: BaseViewController {
    
    var movie: MovieViewModel?
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var btnSee: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configUI() {
        super.configUI()
        self.addGradientMask(onView: img)
        self.btnSee.layer.cornerRadius = 8.0
        self.btnSee.layer.borderWidth = 1.0
        self.btnSee.layer.borderColor = UIColor.white.cgColor
        self.btnSee.backgroundColor = .clear
    }
    
    func addGradientMask(onView: UIView) {
        let gradientMaskLayer = CAGradientLayer()
        gradientMaskLayer.frame = onView.bounds
        gradientMaskLayer.colors = [UIColor.clear.cgColor,
                                    UIColor.white.cgColor,
                                    UIColor.white.cgColor,
                                    UIColor.white.cgColor,
                                    UIColor.clear.cgColor,
                                    UIColor.white.cgColor]
        gradientMaskLayer.locations = [0, 0.2, 0.3, 0.6, 0.7, 1]
        onView.layer.mask = gradientMaskLayer
    }
    
    override func setup() {
        super.setup()
        if let movie = movie {
            let url = URL(string: movie.imageURL)
            self.setupImage(url: url)
            self.lblTitle.text = movie.title
            self.lblDescription.text = movie.overview
        }

    }
    
    func setupImage(url: URL?) {
        let processor = DownsamplingImageProcessor(size: Constant.sizeMoviewImage)
        img.kf.indicatorType = .activity
        img.kf.setImage(
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
    
    @IBAction func showVideo() {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as? WebViewController {
            vc.url = movie!.trailerURL
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

}
