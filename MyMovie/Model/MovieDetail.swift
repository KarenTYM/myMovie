//
//  MovieDetail.swift
//  MyMovie
//
//  Created by Fabio Makihara on 18/02/21.
//

import Foundation


struct MovieDetail: Codable {
    let title:String?
    let posterPath:String?
    let overview:String?
    let releaseDate:String?
    let id:Int?
    let backdropPath:String?
    let voteCount:Int?
    let voteAverage:Double?
    let budget:Double?
    let runtime:Int?
    let video:Bool?
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case posterPath = "poster_path"
        case overview = "overview"
        case releaseDate = "release_date"
        case id = "id"
        case backdropPath = "backdrop_path"
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
        case budget = "budget"
        case runtime = "runtime"
        case video = "video"
    }
}
