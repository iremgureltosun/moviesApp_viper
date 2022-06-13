//
//  MovieDetailsPresenter.swift
//  InvioAPI
//
//  Created irem TOSUN on 2.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

/// MovieDetails Module Presenter
class MovieDetailsPresenter: MovieDetailsPresenterProtocol {
    weak var view: MovieDetailsViewControllerProtocol!
    var interactor: MovieDetailsInteractorProtocol!
    var router: MovieDetailsRouterProtocol!

    init() {
    }

    func presentView(model: MovieViewModel) {
        view.displayView(viewModel: model)
    }
}
