//
//  Credits.swift
//  MyMovie
//
//  Created by Fabio Makihara on 19/02/21.
//

import Foundation


struct Credits:Codable {
    let id:Int?
    let cast:[Cast]
    let crew:[Crew]
    
    enum CodingKeys:String, CodingKey {
        case id = "id"
        case cast = "cast"
        case crew = "crew"
    }
}


struct Cast:Codable {
    let name:String?
    let popularity:Double?
    let character:String?
    
    enum CodingKeys:String, CodingKey {
        case name = "name"
        case popularity = "popularity"
        case character = "character"
    }
}

struct Crew:Codable {
    let department:String?
    let name:String?
    let job:String?
    
    enum CodingKeys:String, CodingKey {
        case department = "department"
        case name = "name"
        case job = "job"
    }
}
