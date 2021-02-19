//
//  DetailViewController.swift
//  MyMovie
//
//  Created by Fabio Makihara on 17/02/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var voteCountLabel: UILabel!
    @IBOutlet weak var voteAverageLabel: UILabel!
    @IBOutlet weak var budgetLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var releaseDataLabel: UILabel!
    @IBOutlet weak var overviewTextView: UITextView!
    @IBOutlet weak var castButton: UIButton!
    @IBOutlet weak var crewButton: UIButton!
    
    var movie:PopularMovie?
    var movieID:Int?
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.movieImageView.layer.cornerRadius = 5
        self.castButton.layer.cornerRadius = 5
        self.crewButton.layer.cornerRadius = 5
        self.setupView()
        self.movieID = self.movie?.id ?? 0
        print("____________________\(self.movieID)")
    }
    
    
    // MARK: - setupView
    func setupView() {
        API.getMoviesDetails(movieID: self.movie?.id ?? 0) { (detail) in
            self.titleLabel.text = detail.title ?? "No title"
            self.voteCountLabel.text = "Total de votos: \(String(detail.voteCount ?? 0))"
            self.voteAverageLabel.text = "Média: \(String(detail.voteAverage ?? 0.0))"
            self.budgetLabel.text = "Orçamento: R$\(String(describing: detail.budget ?? 0))"
            self.runtimeLabel.text = "Tempo: \(String(describing: detail.runtime ?? 0)) minutos"
            self.releaseDataLabel.text = "Lançamento: \(detail.releaseDate ?? "0000-00-00")"
            self.overviewTextView.text = detail.overview
            self.movieImageView.downloaded(from: "\(backdropUrl)\(detail.posterPath ?? "")", contentMode: .scaleAspectFill)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CastViewController" {
            let vc:CastViewController? = segue.destination as? CastViewController
            vc?.movieID = self.movieID ?? 0
        } else {
            let vc:CrewViewController? = segue.destination as? CrewViewController
            vc?.movieID = self.movieID ?? 0
        }
    }
    
    @IBAction func castButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "CastViewController", sender: self.movie?.id)
    }
    
    
    @IBAction func crewButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "CrewViewController", sender: nil)
    }
}
