//
//  CastViewController.swift
//  MyMovie
//
//  Created by Fabio Makihara on 19/02/21.
//

import UIKit

class CastViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var castTableView: UITableView!
    
//    var credits:Credits?
    var castArray:[Cast]?
    var movieID:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configView()
        self.fetchCast()
        print("****************\(self.movieID)")
        // Do any additional setup after loading the view.
    }

    private func configView() {
        self.castTableView.delegate = self
        self.castTableView.dataSource = self
        
        self.castTableView.register(UINib(nibName: "CastCell", bundle: nil), forCellReuseIdentifier: "CastCell")
    }
    
    private func fetchCast() {
        API.getCredits(movieID: self.movieID ?? 0) { (data) in
            self.castArray = data.cast
            self.castTableView.reloadData()
        }
    }
}



extension CastViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.castArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CastCell? = self.castTableView.dequeueReusableCell(withIdentifier: "CastCell", for: indexPath) as? CastCell
        guard let _castArray = self.castArray?[indexPath.row] else {fatalError()}
        cell?.setupCastCell(cast: _castArray)
        return cell ?? UITableViewCell()
    }
}
