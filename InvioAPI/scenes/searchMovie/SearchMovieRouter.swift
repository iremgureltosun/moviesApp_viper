//
//  SearchMovieRouter.swift
//  InvioAPI
//
//  Created irem TOSUN on 2.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

/// SearchMovie Module Router
class SearchMovieRouter: SearchMovieRouterProtocol {
    private let viewControllerFactory: ViewControllerFactoryProtocol

    init(viewControllerFactory: ViewControllerFactoryProtocol) {
        self.viewControllerFactory = viewControllerFactory
    }

    func navigateToDetails(viewModel: MovieViewModel, vc: UIViewController) {
        let nextVC = viewControllerFactory.movieDetails()
        nextVC.setViewModel(viewModel: viewModel)
        let destination = nextVC as! UIViewController
        DispatchQueue.main.async {
            vc.navigationController?.pushViewController(destination, animated: true)
        }
    }
}
