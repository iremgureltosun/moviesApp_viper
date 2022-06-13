//
//  MovieDetailsContracts.swift
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
/// MovieDetails Module ViewController Protocol
protocol MovieDetailsViewControllerProtocol: AnyObject {
    func setViewModel(viewModel: MovieViewModel)
    func displayView(viewModel: MovieViewModel)
}

// MARK: Interactor -

/// MovieDetails Module Interactor Protocol
protocol MovieDetailsInteractorProtocol {
    var presenter: MovieDetailsPresenterProtocol! { get set }
}

// MARK: Presenter -

/// MovieDetails Module Presenter Protocol
protocol MovieDetailsPresenterProtocol {
    var view: MovieDetailsViewControllerProtocol! { get set }
    var interactor: MovieDetailsInteractorProtocol! { get set }
    var router: MovieDetailsRouterProtocol! { get set }
    func presentView(model: MovieViewModel)
}

// MARK: Router (aka: Wireframe) -

/// MovieDetails Module Router Protocol
protocol MovieDetailsRouterProtocol {
}
