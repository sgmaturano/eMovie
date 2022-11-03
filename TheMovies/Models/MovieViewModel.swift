//
//  MovieViewModel.swift
//  TheMovies
//
//  Created by Sergio Maturano on 01/11/2022.
//

import UIKit
import CoreData

struct MovieViewModel {
    
    let bgImage: String
    let id: String
    let image: String
    let lang: String
    let releaseDate: String
    let title: String
    let overview: String
    let deleted: Bool
    let dateSync: Date
    let type: String
    let link: String
    
    var trailerURL: String {
        return Constant.baseVideoURL + self.link
    }
    
    var imageURL: String {
        return Constant.baseImageURL + self.image
    }
    
    static func create(data: NSManagedObject) -> MovieViewModel {
        let movie = MovieViewModel(bgImage: data.value(forKey: "bgImage") as? String ?? "",
                                   id: data.value(forKey: "id") as? String ?? "",
                                   image: data.value(forKey: "image") as? String ?? "",
                                   lang: data.value(forKey: "lang") as? String ?? "",
                                   releaseDate: data.value(forKey: "releaseDate") as? String ?? "",
                                   title: data.value(forKey: "title") as? String ?? "",
                                   overview: data.value(forKey: "overview") as? String ?? "",
                                   deleted: data.value(forKey: "removed") as? Bool ?? false,
                                   dateSync: data.value(forKey: "dateSync") as? Date ?? Date(),
                                   type: data.value(forKey: "type") as? String ?? "",
                                   link: data.value(forKey: "link") as? String ?? "")
        return movie
    }
    
    static func dbUpdate(movie: NSManagedObject, obj: TMMovie, type: MovieSection) {
        movie.setValue(obj.backdropPath ?? "", forKey: "bgImage")
        movie.setValue(obj.id?.toString() ?? "-1", forKey: "id")
        movie.setValue(obj.posterPath ?? "", forKey: "image")
        movie.setValue(obj.originalLanguage ?? "", forKey: "lang")
        movie.setValue(obj.releaseDate ?? "", forKey: "releaseDate")
        movie.setValue(obj.title ?? "", forKey: "title")
        movie.setValue(obj.overview ?? "", forKey: "overview")
        movie.setValue(false, forKey: "removed")
        movie.setValue(Date(), forKey: "dateSync")
        movie.setValue(type.rawValue, forKey: "type")
        movie.setValue("", forKey: "link")

    }
}
