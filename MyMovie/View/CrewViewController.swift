//
//  CrewViewController.swift
//  MyMovie
//
//  Created by Fabio Makihara on 19/02/21.
//

import UIKit

class CrewViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var crewTableView: UITableView!
    
    var crewArray:[Crew]?
    var movieID:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configView()
        self.fetchCrew()
        // Do any additional setup after loading the view.
    }
    
    private func configView() {
        self.crewTableView.delegate = self
        self.crewTableView.dataSource = self
        
        self.crewTableView.register(UINib(nibName: "CastCell", bundle: nil), forCellReuseIdentifier: "CastCell")
    }
    
    private func fetchCrew() {
        API.getCredits(movieID: self.movieID ?? 0) { (data) in
            self.crewArray = data.crew
            self.crewTableView.reloadData()
        }
    }
}


// MARK: - extension TableView
extension CrewViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.crewArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CastCell? = self.crewTableView.dequeueReusableCell(withIdentifier: "CastCell", for: indexPath) as? CastCell
        guard let _crewArray = self.crewArray?[indexPath.row] else {fatalError()}
        cell?.setupCrewCell(crew: _crewArray)
        return cell ?? UITableViewCell()
    }
    
    
}
