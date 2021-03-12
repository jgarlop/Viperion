//
//  DemoRouter.swift
//  Viperion
//
//  Created by Javier García López on 26/2/21.
//

import Foundation

final class DemoRouter {
    static func assemble() -> DemoVC {
        let interactor = DemoImpl()

        let presenter = DemoPresenterImpl(interactor: interactor)
        interactor.output = presenter

        let vc = DemoVC(presenter: presenter)
        presenter.output = vc
        
        return vc
    }
}
