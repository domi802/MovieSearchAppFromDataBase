//
//  MovieListViewModel.swift
//  MovieSearchApp
//
//  Created by Dominik Woźniak on 26/04/2022.
//

import Foundation
import SwiftUI

class MovieListViewModel: ObservableObject {
    
    @Published var movies : [MovieViewModel] = []
    
func search(name: String) async{
    do{
    let movies = try  await Webservice().getMovie(searchTerm: name)
        self.movies = movies.map(MovieViewModel.init)
    }catch{
        print(error)
    }
}
}

struct MovieViewModel {
    
    
    let movie: Movie
    
    var imdbID: String{
        movie.imdbID
    }
    
    var title: String{
        movie.title
    }
    
    var poster: URL? {
        URL(string: movie.poster)
    }
    
}
