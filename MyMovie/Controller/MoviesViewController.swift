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
    
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.configView()
    }
    
    
    // MARK: - configView
    private func configView() {
        self.movieTableView.delegate = self
        self.movieTableView.dataSource = self
        
        self.movieTableView.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: "MovieCell")
    }
}


// MARK: - extension TableViewDelegate, TableViewDataSource
extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MovieCell? = self.movieTableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieCell
        return cell ?? UITableViewCell()
    }
}



