//
//  CommonAssembly.swift
//  InvioAPI
//
//  Created by irem TOSUN on 2.06.2022.
//

import Foundation
import Swinject

class ServiceAssembly: Assembly {
    func assemble(container: Container) {
        container.register(MovieSearchServiceProtocol.self) { _ in
            MovieSearchService()
        }.inObjectScope(.container)
    }
}
