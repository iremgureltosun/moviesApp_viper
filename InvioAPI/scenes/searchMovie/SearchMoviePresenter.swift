//
//  SearchMoviePresenter.swift
//  InvioAPI
//
//  Created irem TOSUN on 2.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

/// SearchMovie Module Presenter
class SearchMoviePresenter: SearchMoviePresenterProtocol {
    weak var view: SearchMovieViewControllerProtocol!
    var interactor: SearchMovieInteractorProtocol!
    var router: SearchMovieRouterProtocol!
    private var list: [Movie]?

    init() {
    }

    func sendSearchRequest(for movieTitle: String) {
        interactor.search(by: movieTitle)
    }

    func captureResults(list: [Movie]) {
        self.list = list
        if list.count == 0 {
            view.displayNotFound()
        } else {
            view.displayMoviesTableView()
        }
    }

    var rowCount: Int {
        return list?.count ?? 0
    }

    func navigateToDetails(at index: IndexPath, vc: UIViewController) {
        guard let viewModel = getViewModel(at: index) else {
            return
        }
        router.navigateToDetails(viewModel: viewModel, vc: vc)
    }

    func getViewModel(at index: IndexPath) -> MovieViewModel? {
        guard let list = list else {
            return nil
        }
        guard index.row < list.count else {
            return nil
        }

        return MovieViewModel(movie: list[index.row])
    }

    func showErrorMessage(error: Error) {
        view.showErrorMessage(error: error)
    }
}
