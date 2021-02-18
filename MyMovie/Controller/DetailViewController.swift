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
    
    var movie:PopularMovie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.movieImageView.layer.cornerRadius = 5
        
        API.getMoviesDetails(movieID: movie?.id ?? 0) { (detail) in
            self.titleLabel.text = detail.title ?? "No title"
            self.voteCountLabel.text = "Total de votos: \(String(detail.voteCount ?? 0))"
            self.voteAverageLabel.text = "Média: \(String(detail.voteAverage ?? 0.0))"
            self.budgetLabel.text = "R$\(String(describing: detail.budget ?? 0))"
            self.runtimeLabel.text = "\(String(describing: detail.runtime ?? 0)) minutos"
            self.releaseDataLabel.text = "Data de lançamento: \(detail.releaseDate ?? "0000-00-00")"
            self.overviewTextView.text = detail.overview
            self.movieImageView.downloaded(from: "\(backdropUrl)\(detail.posterPath ?? "")", contentMode: .scaleAspectFill)
        }
    }
}
