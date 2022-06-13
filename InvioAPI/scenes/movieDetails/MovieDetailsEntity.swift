//
//  MovieDetailsEntity.swift
//  InvioAPI
//
//  Created irem TOSUN on 2.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

/// MovieDetails Module Entity

struct MovieViewModel {
    let title: String
    let genre: String
    let writer: String
    let ratings: String
    let country: String
    let language: String
    let director: String
    let actors: String
    let plotShort: String
    let plot: String
    let poster: String

    init(movie: Movie) {
        title = movie.title
        genre = movie.genre
        writer = movie.writer
        ratings = movie.displayableRatings
        country = movie.country
        language = movie.language
        director = movie.director
        actors = movie.actors
        plotShort = movie.shortPlot
        plot = movie.plot
        poster = movie.poster
    }
}
