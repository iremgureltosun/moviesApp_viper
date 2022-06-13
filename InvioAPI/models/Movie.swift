//
//  MovieDataModel.swift
//  InvioAPI
//
//  Created by irem TOSUN on 2.06.2022.
//

import Foundation

// MARK: - Movie

struct Movie: Codable {
    let title, year, rated, released: String
    let runtime, genre, director, writer: String
    let actors, plot, language, country: String
    let awards: String
    let poster: String
    let ratings: [Rating]
    let metascore, imdbRating, imdbVotes, imdbID: String
    let type, dvd, boxOffice, production: String
    let website, response: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case awards = "Awards"
        case poster = "Poster"
        case ratings = "Ratings"
        case metascore = "Metascore"
        case imdbRating, imdbVotes, imdbID
        case type = "Type"
        case dvd = "DVD"
        case boxOffice = "BoxOffice"
        case production = "Production"
        case website = "Website"
        case response = "Response"
    }
}

// MARK: - Rating

struct Rating: Codable {
    let source, value: String

    enum CodingKeys: String, CodingKey {
        case source = "Source"
        case value = "Value"
    }
}

extension Movie {
    var shortPlot: String {
        guard plot.count > 0 else { return plot }
        guard plot.count > 100 else { return plot }

        let index = plot.index(plot.startIndex, offsetBy: 100)
        let plotShortened = plot[..<index]
        return String(plotShortened) + "..."
    }

    var displayableRatings: String {
        var text = ""
        
        let sources = ratings.map { $0.source }
        let values = ratings.map { $0.value }
        if sources.count == values.count {
            for i in 0 ..< sources.count {
                text += "\(sources[i])"
                text += ":\(values[i]) \n"
            }
        }
        return text
    }
}
