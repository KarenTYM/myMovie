//
//  MovieCell.swift
//  MyMovie
//
//  Created by Fabio Makihara on 17/02/21.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var backgrondView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var voteAverageLabel: UILabel!
    @IBOutlet weak var voteCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setupCell(movie:Movie) {
        self.backgroundView?.layer.cornerRadius = 10
        self.titleLabel.text = movie.title ?? "No title"
        self.movieImageView.image =  UIImage(named: "\(movie.posterPath ?? "")")
    }
}
