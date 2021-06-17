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

protocol DemoPresenterOutput: AnyObject {
    func showNewString(_ string: String)
    func enableButton(_ enabled: Bool)
}

final class DemoPresenterImpl: DemoPresenter {
    weak var output: DemoPresenterOutput?
    let interactor: Demo

    init(interactor: Demo) {
        self.interactor = interactor
    }

    func getNewString() {
        interactor.retrieveNewString()
    }
}

extension DemoPresenterImpl: DemoOutput {
    func retrieveNewStringSuccess(newString: String) {
        output?.showNewString(newString)
        output?.enableButton(false)
    }
}
