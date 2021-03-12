//
//  DemoPresenter.swift
//  Viperion
//
//  Created by Javier García López on 26/2/21.
//

import Foundation

protocol DemoPresenter {
    func getNewString()
}

protocol DemoPresenterOutput: class {
    func showNewString(_ string: String)
    func enableButton(_ enabled: Bool)
}

final class DemoPresenterImpl: DemoPresenter {
    weak var output: DemoPresenterOutput?

    func getNewString() {
        let string = "This is a just a demo module to show how VIPER works. Stay tuned!"
        output?.showNewString(string)
        output?.enableButton(false)
    }
}
