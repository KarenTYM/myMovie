//
//  Movie.swift
//  MyMovie
//
//  Created by Fabio Makihara on 17/02/21.
//

import Foundation

struct Movies:Codable {
    let moviesArray:[Movie]
}

struct Movie: Codable {
    let title:String?
    let posterPath:String?
    let ovewview:String?
    let releaseDate:String?
    let id:Int?
    let backdropPath:String?
    let voteCount:Int?
    let voteAverage:Double?
    let budget:Int?
    let runtime:Int?
}
