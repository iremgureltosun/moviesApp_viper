//
//  SearchMovieInteractor.swift
//  InvioAPI
//
//  Created irem TOSUN on 2.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Combine
import os.log
import UIKit

/// SearchMovie Module Interactor
class SearchMovieInteractor: SearchMovieInteractorProtocol, ParserListenerDelegate {
    var presenter: SearchMoviePresenterProtocol!
    var parserService: ParserServiceProtocol!

    init(service: ParserServiceProtocol) {
        parserService = service
        parserService.assignDelegate(listener: self)
    }

    func didReceiveResult(list: [Movie]?, error: Error?) {
        guard let error = error else {
            if let list = list {
                presenter.captureResults(list: list)
            }
            return
        }
        presenter.showErrorMessage(error: error)
    }

    func search(by title: String) {
        parserService.getMovies(by: title)
    }
}
