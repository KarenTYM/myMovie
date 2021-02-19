//
//  CastCell.swift
//  MyMovie
//
//  Created by Fabio Makihara on 19/02/21.
//

import UIKit

class CastCell: UITableViewCell {
    
    @IBOutlet weak var fundoView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var characterLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCastCell(cast:Cast) {
        self.fundoView.layer.cornerRadius = 10
        self.nameLabel.text = cast.name ?? ""
        self.characterLabel.text = "Personagem: \(cast.character ?? "")"
        self.popularityLabel.text = "Popularidade: \(String(cast.popularity ?? 0))"
    }
    
    func setupCrewCell(crew:Crew) {
        self.fundoView.layer.cornerRadius = 10
        self.nameLabel.text = crew.name ?? ""
        self.characterLabel.text = "Departamento: \(crew.department ?? "")"
        self.popularityLabel.text = "Cargo: \(crew.job ?? "")"
    }
}
