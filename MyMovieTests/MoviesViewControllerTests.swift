//
//  MoviesViewControllerTests.swift
//  MyMovieTests
//
//  Created by Fabio Makihara on 19/02/21.
//

import XCTest

class MoviesViewControllerTests: XCTestCase {
    override func tearDown() {
        super.tearDown()
    }
    
   
}
/*
 extension MoviesViewController: UISearchBarDelegate {
     func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
         guard let text = searchrBar.text else {return}
         let query = text.replacingOccurrences(of: " ", with: "%20")
         API.getMovieFiltered(query: query, page: 1) { (data) in
             self.totalPages = data.totalPages ?? 1
             self.movieArray = data.results
             self.movieTableView.reloadData()
         }
         searchBar.resignFirstResponder()
         searchBar.text = ""
     }
 }
 
 // Pra aparecer o losangulo do teste, o método tem que começar com a palavra test
 // por padrão eu nomeio o método com:
 // testOQueEstáTestando_ComoEstáTestando_ResultadoEsperado
 func testCarroMaisRapido_comparandoSetupDoCarro_ferrariMaisRapida() {
     let minutes = 60
     
     ferrari.start(minutes: minutes)
     jeep.start(minutes: minutes)
     
     // o que eu quero que meu resultado seja
     XCTAssertTrue(ferrari.miles > jeep.miles)
 }
 */
