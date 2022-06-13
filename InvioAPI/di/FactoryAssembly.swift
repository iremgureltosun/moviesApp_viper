//
//  CommonUIAssembly.swift
//  InvioAPI
//
//  Created by irem TOSUN on 2.06.2022.
//

import Foundation
import Swinject
import UIKit

class FactoryAssembly: Assembly {
    private let assembler: Assembler

    init(assembler: Assembler) {
        self.assembler = assembler
    }

    func assemble(container: Container) {
        container.register(ViewControllerFactoryProtocol.self) { _ in
            ViewControllerFactory(assembler: self.assembler)
        }
    }
}
