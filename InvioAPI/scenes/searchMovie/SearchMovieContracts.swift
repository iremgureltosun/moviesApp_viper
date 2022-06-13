//
//  SearchMovieContracts.swift
//  InvioAPI
//
//  Created irem TOSUN on 2.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

// MARK: View -

/*
 Should replace "class" with "BaseViewProtocol" if available;
 & that will allow the View to act as a UIViewController;
 & Implement common view functions.
 */
/// SearchMovie Module ViewController Protocol
protocol SearchMovieViewControllerProtocol: AnyObject {
    func displayMoviesTableView()
    func displayNotFound()
    func showErrorMessage(error: Error)
    func addNavigationBar(_ navBar: UINavigationBar)
}

// MARK: Interactor -

/// SearchMovie Module Interactor Protocol
protocol SearchMovieInteractorProtocol {
    var presenter: SearchMoviePresenterProtocol! { get set }
    func search(by title: String)
}

// MARK: Presenter -

/// SearchMovie Module Presenter Protocol
protocol SearchMoviePresenterProtocol {
    var view: SearchMovieViewControllerProtocol! { get set }
    var interactor: SearchMovieInteractorProtocol! { get set }
    var router: SearchMovieRouterProtocol! { get set }
    var rowCount: Int { get }
    func sendSearchRequest(for movieTitle: String)
    func captureResults(list: [Movie])
    func navigateToDetails(at index: IndexPath, vc: UIViewController)
    func showErrorMessage(error: Error)
    func getViewModel(at index: IndexPath) -> MovieViewModel?
}

// MARK: Router (aka: Wireframe) -

/// SearchMovie Module Router Protocol
protocol SearchMovieRouterProtocol {
    func navigateToDetails(viewModel: MovieViewModel, vc: UIViewController)
}
