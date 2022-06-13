//
//  MovieDetailsAssembly.swift
//  InvioAPI
//
//  Created irem TOSUN on 2.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import Swinject
import UIKit

class MovieDetailsAssembly: Assembly {

    func assemble(container: Container) {
        container.register(MovieDetailsViewControllerProtocol.self) { r in
            let view = MovieDetailsViewController()
            let router = r.resolve(MovieDetailsRouterProtocol.self)!
            var interactor = r.resolve(MovieDetailsInteractorProtocol.self)!
            var presenter = r.resolve(MovieDetailsPresenterProtocol.self)!
            
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
            view.presenter = presenter
            
            return view
        }

        container.register(MovieDetailsRouterProtocol.self) { r in
            MovieDetailsRouter(viewControllerFactory: r.resolve(ViewControllerFactoryProtocol.self)!)
        }
        
        container.register(MovieDetailsInteractorProtocol.self) { r in
            MovieDetailsInteractor()
        }
        
        container.register(MovieDetailsPresenterProtocol.self) { r in
            MovieDetailsPresenter()
        }
    }
}
