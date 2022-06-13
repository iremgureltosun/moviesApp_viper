//
//  MovieDetailsViewController.swift
//  InvioAPI
//
//  Created irem TOSUN on 2.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

/// MovieDetails Module ViewController
class MovieDetailsViewController: BaseViewController {
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var genreLabel: UILabel!
    @IBOutlet var languageLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var plotLabel: UILabel!
    @IBOutlet var actorsLabel: UILabel!
    @IBOutlet var writerLabel: UILabel!
    @IBOutlet var directorLabel: UILabel!

    var presenter: MovieDetailsPresenterProtocol!
    var viewModel: MovieViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let viewModel = viewModel {
            presenter.presentView(model: viewModel)
        }
    }

    func displayView(viewModel: MovieViewModel) {
        posterImageView.loadFrom(urlPath: viewModel.poster)
        genreLabel.text = viewModel.genre
        countryLabel.text = viewModel.country
        languageLabel.text = viewModel.language
        directorLabel.text = viewModel.director
        actorsLabel.text = viewModel.actors
        plotLabel.text = viewModel.plot
        writerLabel.text = viewModel.writer
        self.title = viewModel.title
    }

    func setViewModel(viewModel: MovieViewModel) {
        self.viewModel = viewModel
    }
}

// MARK: - extending MovieDetailsView to implement it's protocol

extension MovieDetailsViewController: MovieDetailsViewControllerProtocol {
}
