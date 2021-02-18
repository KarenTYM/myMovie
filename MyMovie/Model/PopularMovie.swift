//
//  Movie.swift
//  MyMovie
//
//  Created by Fabio Makihara on 17/02/21.
//

import Foundation

struct Results:Codable {
    let results:[PopularMovie]
    let page:Int?
    let totalPages: Int?
    let totalResults: Int?
    
    enum CodingKeys:String, CodingKey {
        case results = "results"
        case page = "page"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}


struct PopularMovie: Codable {
    let title:String?
    let posterPath:String?
    let overview:String?
    let releaseDate:String?
    let id:Int?
    let backdropPath:String?
    let voteCount:Int?
    let voteAverage:Double?
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case posterPath = "poster_path"
        case overview = "overview"
        case releaseDate = "release_date"
        case id = "id"
        case backdropPath = "backdrop_path"
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
    }
}


