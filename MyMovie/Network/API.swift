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
private let apiKey = "api_key=04086c212ff4d6f21382347b01ffdc69"

class API {
    class func getPopularMovies(page:Int, onSuccess: @escaping (Results) -> Void) {
        JSONDecoder().keyDecodingStrategy = .convertFromSnakeCase
        let urlStr = "\(baseUrl)popular?\(apiKey)&language=pt-BR&page=\(page)"
        guard let url = URL(string: urlStr) else {fatalError("Unable to get url")}
        
        // método da classe Alamofire que pega uma url e traz uma resposta
        AF.request(url).response { response in
            switch response.result {
            case .success(let data):
                guard let data = data else {fatalError("Unable to parse data from api")}
                guard let results = try? JSONDecoder().decode(Results.self, from: data) else {fatalError("Unable to parse data in to JSon")}
                DispatchQueue.main.async {
                    onSuccess(results)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
  
    
    class func getMoviesDetails(movieID: Int, onSucess: @escaping (MovieDetail) -> Void) {
        JSONDecoder().keyDecodingStrategy = .convertFromSnakeCase
        let urlStr = "\(baseUrl)\(movieID)?\(apiKey)&language=pt-BR"
        guard let url = URL(string: urlStr) else {fatalError("Unable to get url")}
        
        AF.request(url).response { response in
            switch response.result {
            case .success(let data):
                guard let data = data else { fatalError("Unable fo parse data from api")}
                guard let details = try? JSONDecoder().decode(MovieDetail.self, from: data) else { fatalError("Unable to parse data in to Json")}
                DispatchQueue.main.async {
                    onSucess(details)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    

    class func getMovieFiltered(query:String, page:Int, onSuccess: @escaping (Results) -> Void) {
        JSONDecoder().keyDecodingStrategy = .convertFromSnakeCase
        let urlStr = "https://api.themoviedb.org/3/search/movie?\(apiKey)&query=\(query)&language=pt-BR&page=\(page)"
        guard let url = URL(string: urlStr) else {fatalError("Unable to get url")}
        
        // método da classe Alamofire que pega uma url e traz uma resposta
        AF.request(url).response { response in
            switch response.result {
            case .success(let data):
                guard let data = data else {fatalError("Unable to parse data from api")}
                guard let results = try? JSONDecoder().decode(Results.self, from: data) else {fatalError("Unable to parse data in to JSon")}
                DispatchQueue.main.async {
                    onSuccess(results)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    //https://api.themoviedb.org/3/movie/{movie_id}/credits?api_key=<<api_key>>&language=en-US
    class func getCredits(movieID:Int, onSuccess: @escaping (Credits) -> Void) {
        JSONDecoder().keyDecodingStrategy = .convertFromSnakeCase
        let urlStr = "\(baseUrl)\(movieID)/credits?\(apiKey)&language=pt-BR"
        guard let url = URL(string: urlStr) else {fatalError("Unable to get url")}
        
        // Método da classe Alamofire que pega uma url e traz uma resposta
        AF.request(url).response { response in
            switch response.result {
            case .success(let data):
                guard let data = data else {fatalError("Unable to parse data from api")}
                guard let credit = try? JSONDecoder().decode(Credits.self, from: data) else {fatalError("Unable to parse data in to Json")}
                print("================= \(credit.id ?? 0)")
                DispatchQueue.main.async {
                    onSuccess(credit)
                }
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
    }
}


