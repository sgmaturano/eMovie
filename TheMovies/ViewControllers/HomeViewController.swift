//
//  HomeViewController.swift
//  TheMovies
//
//  Created by Sergio Maturano on 01/11/2022.
//

import UIKit

class HomeViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var arrData: [MovieSection] {
        return MovieSection.allCases
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "title.app".localized
    }
    
    func movieDetail(movie: MovieViewModel) {
        self.performSegue(withIdentifier: "movie_detail", sender: movie)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? MovieDetailViewController {
            vc.movie = sender as? MovieViewModel
        }
    }
    
}

extension HomeViewController: MovieHorizontalListViewCellDelegate {
    
    func didSelectMovie(movie: MovieViewModel) {
        self.movieDetail(movie: movie)
    }
    
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = arrData[indexPath.row]
        let identifier = section == .topRate ? MovieVerticalListViewCell.identifier : MovieHorizontalListViewCell.identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! MovieHorizontalListViewCell
        cell.section = section
        cell.delegate = self
        return cell
    }
    
}
