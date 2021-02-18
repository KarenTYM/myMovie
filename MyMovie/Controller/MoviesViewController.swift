//
//  ViewController.swift
//  MyMovie
//
//  Created by Fabio Makihara on 17/02/21.
//

import UIKit

class MoviesViewController: UIViewController {
    
    @IBOutlet weak var searchrBar: UISearchBar!
    @IBOutlet weak var movieTableView: UITableView!
    
    private var movieArray:[PopularMovie]?
    private var page:Int = 1
    private var totalPages:Int = 0
    
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.configView()
        self.fetchMovies()
    }
    
    
    // MARK: - configView
    private func configView() {
        self.movieTableView.delegate = self
        self.movieTableView.dataSource = self
        self.searchrBar.delegate = self
        
        self.movieTableView.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: "MovieCell")
    }
    
    
    // MARK: - fetchMovies
    private func fetchMovies(page:Int = 1) {
        API.getPopularMovies(page:page) { data in
            self.totalPages = data.totalPages ?? 1
            self.movieArray = data.results
            self.movieTableView.reloadData()
        }
    }
    
    // MARK: - loadMoreData
    private func loadMoreData() {
        if self.page < self.totalPages {
            self.page += 1
            OperationQueue.main.addOperation {
                API.getPopularMovies(page: self.page) { (data) in
                    self.movieArray? += data.results
                    self.movieTableView.reloadData()
                }
            }
        }
    }
}


// MARK: - extension TableViewDelegate, TableViewDataSource
extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MovieCell? = self.movieTableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieCell
        guard let _movieArray = self.movieArray?[indexPath.row] else {fatalError()}
        cell?.setupCell(movie: _movieArray)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let count = self.movieArray?.count else {fatalError()}
        if indexPath.row == count - 1 {
            self.loadMoreData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "DetailViewController", sender: self.movieArray?[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let movie:PopularMovie? = sender as? PopularMovie
        let vc = segue.destination as? DetailViewController
        vc?.movie = movie
    }
}


// MARK: - extension UISearchBarDelegate
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
