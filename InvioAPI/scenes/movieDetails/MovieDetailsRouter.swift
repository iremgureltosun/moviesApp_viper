//
//  MovieDetailsRouter.swift
//  InvioAPI
//
//  Created irem TOSUN on 2.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

/// MovieDetails Module Router
class MovieDetailsRouter: MovieDetailsRouterProtocol {
        
    private let viewControllerFactory: ViewControllerFactoryProtocol

    init(viewControllerFactory: ViewControllerFactoryProtocol) {
        self.viewControllerFactory = viewControllerFactory
    }
}
