//
//  ParserAssembly.swift
//  InvioAPI
//
//  Created by irem TOSUN on 4.06.2022.
//

import Foundation
import Swinject

class ParserAssembly: Assembly {
    func assemble(container: Container) {
        container.register(ParserServiceProtocol.self) { r in
            ParserService(searchService: r.resolve(MovieSearchServiceProtocol.self)!)
        }.inObjectScope(.container)
    }
}
