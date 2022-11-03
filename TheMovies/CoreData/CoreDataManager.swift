//
//  CoreDataManager.swift
//  TheMovies
//
//  Created by Sergio Maturano on 01/11/2022.
//

import Foundation
import CoreData

enum MovieSection: String, CaseIterable {
    case trending = "trend"
    case upcoming = "upcoming"
    case topRate = "top"

}

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    init() {
        
    }
    
    func getAllMovies(filter: NSPredicate? = nil) -> [MovieViewModel] {
        let context = AppDelegate.shared.context
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Movie")
        request.predicate = filter
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            var arrMovies = [MovieViewModel]()
            for data in result as! [NSManagedObject] {
                let movie = MovieViewModel.create(data: data)
                arrMovies.append(movie)
            }
            return arrMovies
        } catch {
            print("Failed")
        }
        return [MovieViewModel]()
    }
    
    func getMovieBy(section: MovieSection) -> [MovieViewModel] {
        let filter = NSPredicate(format: "type = %@", section.rawValue)
        let arr = self.getAllMovies(filter: filter)
        if section == .topRate {
            return Array(arr.prefix(Constant.numberItemsRecommed))
        }
        return arr
    }
    
    // MARK: - Video
    func updateVideoMovie(idMovie: String, key:String) {
        let context = AppDelegate.shared.context
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Movie")
        request.predicate = NSPredicate(format: "id == %@", idMovie)
        do {
            let result = try context.fetch(request)
            if let arrData = result as? [NSManagedObject] {
                if let movie = arrData.first {
                    movie.setValue(key, forKey: "link")
                    do {
                        try context.save()
                        print("saved")
                    } catch {
                        print("Failed saving")
                    }
                }
            }
        } catch {
            print("Failed")
        }

    }
    
    // MARK: - Movies
    
    func saveMoviesTrend(arr: [TMMovie]) {
        for objMovie in arr {
            self.saveMovie(obj: objMovie, type: MovieSection.trending)
        }
    }
    
    func saveMoviesUpcoming(arr: [TMMovie]) {
        for objMovie in arr {
            self.saveMovie(obj: objMovie, type: MovieSection.upcoming)
        }
    }
    
    func saveMoviesTop(arr: [TMMovie]) {
        for objMovie in arr {
            self.saveMovie(obj: objMovie, type: MovieSection.topRate)
        }
    }
    
    private func saveMovie(obj: TMMovie, type: MovieSection) {
        let context = AppDelegate.shared.context
        let entity = NSEntityDescription.entity(forEntityName: "Movie", in: context)
        let movie = NSManagedObject(entity: entity!, insertInto: context)
        MovieViewModel.dbUpdate(movie: movie, obj: obj, type: type)
        do {
            try context.save()
        } catch {
            print("Error saving")
        }
    }

    
}
