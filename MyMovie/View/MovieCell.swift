//
//  MovieCell.swift
//  MyMovie
//
//  Created by Fabio Makihara on 17/02/21.
//

import UIKit
import Kingfisher

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var backgrondView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var voteAverageLabel: UILabel!
    @IBOutlet weak var voteCountLabel: UILabel!
    
//    var movie:PopularMovie? {
//        didSet {
//            if let movie = movie {
//                self.movieImageView.kf.setImage(with: "\(movie.posterPath ?? "")".url)
//            }
//        }
//    }
//
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setupCell(movie:PopularMovie) {
        self.titleLabel.text = movie.title ?? "No title"
        self.voteCountLabel.text = "Total de votos: \(String(movie.voteCount ?? 0))"
        self.voteAverageLabel.text = "Média dos Votos: \(String(movie.voteAverage ?? 0.0))"
        self.backgrondView.layer.cornerRadius = 10
        self.movieImageView.layer.cornerRadius = 5
        self.movieImageView.downloaded(from: "\(posterUrl)\(movie.posterPath ?? "")", contentMode: .scaleAspectFill)
    }
}
