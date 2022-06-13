//
//  SearchMovieAssembly.swift
//  InvioAPI
//
//  Created irem TOSUN on 2.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import Swinject
import UIKit

class SearchMovieAssembly: Assembly {

    func assemble(container: Container) {
        container.register(SearchMovieViewControllerProtocol.self) { r in
            let view = SearchMovieViewController()
            let router = r.resolve(SearchMovieRouterProtocol.self)!
            var interactor = r.resolve(SearchMovieInteractorProtocol.self)!
            var presenter = r.resolve(SearchMoviePresenterProtocol.self)!
            
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
            view.presenter = presenter
            
            return view
        }

        container.register(SearchMovieRouterProtocol.self) { r in
            SearchMovieRouter(viewControllerFactory: r.resolve(ViewControllerFactoryProtocol.self)!)
        }
        
        container.register(SearchMovieInteractorProtocol.self) { r in
            SearchMovieInteractor(service: r.resolve(ParserServiceProtocol.self)!)
        }
        
        container.register(SearchMoviePresenterProtocol.self) { r in
            SearchMoviePresenter()
        }
    }
}
