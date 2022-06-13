//
//  ViewControllerFactory.swift
//  InvioAPI
//
//  Created by irem TOSUN on 2.06.2022.
//

import Foundation
import Swinject
import UIKit

protocol ViewControllerFactoryProtocol {
    func searchMovie() -> SearchMovieViewControllerProtocol
    func movieDetails() -> MovieDetailsViewControllerProtocol
}

class ViewControllerFactory: ViewControllerFactoryProtocol {
    private let assembler: Assembler

    init(assembler: Assembler) {
        self.assembler = assembler
    }

    func searchMovie() -> SearchMovieViewControllerProtocol {
        return assembler.resolver.resolve(SearchMovieViewControllerProtocol.self)!
    }
    
    func movieDetails() -> MovieDetailsViewControllerProtocol {
        return assembler.resolver.resolve(MovieDetailsViewControllerProtocol.self)!
    }
   
}
