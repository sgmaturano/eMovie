//
//  InitialViewController.swift
//  TheMovies
//
//  Created by Sergio Maturano on 01/11/2022.
//

import UIKit

class InitialViewController: BaseViewController {
    
    let timeDelay = Constant.timeSplashTransitionDelay
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - LoadView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: timeDelay, target: self, selector: #selector(self.timerFinished), userInfo: nil, repeats: false)

    }
    
    @objc func timerFinished() {
        self.sync()
    }
    
    func showHome() {
        if let vc = Storyboard.openStoryboard(name: .Main, indentifier: "initFlow") {
            if let window =  BaseViewController.currentWindows {
                window.setRootViewController(vc, options: TransitionOptions(direction: .fade))
            }
        }
    }
    
    func sync() {
        self.loadDataMovies()
        //self.showHome()
    }
    
    // MARK: - Sync
    private func loadDataMovies() {
        Connection.shared.getListUpcoming { objUpcoming, successUpcoming, errorUpcoming in
            if let arrMoviesUpcoming = objUpcoming as? [TMMovie] {
                CoreDataManager.shared.saveMoviesUpcoming(arr: arrMoviesUpcoming)
            }
            Connection.shared.getListTrending { objTrending, successTrending, errorTrending in
                if let arrMoviesTrending = objTrending as? [TMMovie] {
                    CoreDataManager.shared.saveMoviesTrend(arr: arrMoviesTrending)
                }
                Connection.shared.getListTopRate { objTop, successTop, errorTop in
                    if let arrMoviesTop = objTop as? [TMMovie] {
                        CoreDataManager.shared.saveMoviesTop(arr: arrMoviesTop)
                    }
                    self.updateVideosLink()
                }
            }
        }
    }
    
    private func updateVideosLink() {
        let arrAllMovies = CoreDataManager.shared.getAllMovies()
        var index = 0
        print("sync - \(arrAllMovies.count)")
        for objMovies in arrAllMovies {
            Connection.shared.getVideos(id: objMovies.id) { obj, success, error in
                if let arrVideo = obj as? [TMVideo] {
                    if let video = arrVideo.first(where: { video in
                        if video.type == "Trailer" && video.site == "YouTube" {
                            return true
                        }
                        return false
                    }) {
                        print("updated link - \(index)")
                        CoreDataManager.shared.updateVideoMovie(idMovie: objMovies.id, key: video.key ?? "")
                    }
                }
                index = index + 1
                if index == arrAllMovies.count - 1 {
                    print("finished sync")
                    self.showHome()
                }
            }
        }
    }

}
