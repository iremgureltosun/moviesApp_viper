//
//  MovieListCell.swift
//  InvioAPI
//
//  Created by irem TOSUN on 2.06.2022.
//

import UIKit

class MovieListCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var movieImage: UIImageView!
    @IBOutlet var ratingLabel: UILabel!

    var viewModel: MovieViewModel? {
        didSet {
            titleLabel.text = viewModel?.title ?? ""
            subtitleLabel.text = viewModel?.genre ?? ""
            descriptionLabel.text = viewModel?.plot ?? ""
            if let path = viewModel?.poster {
                movieImage.loadFrom(urlPath: path)
            }
            ratingLabel.text = viewModel?.ratings
        }
    }

    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
