//
//  API.swift
//  MyMovie
//
//  Created by Fabio Makihara on 17/02/21.
//

import Foundation
import Alamofire

private let baseUrl = "https://api.themoviedb.org/3/movie/"
let posterUrl = "https://image.tmdb.org/t/p/original"
let backdropUrl = "https://image.tmdb.org/t/p/w300"
private let apiKey = "04086c212ff4d6f21382347b01ffdc69"
private let coder = JSONDecoder()
