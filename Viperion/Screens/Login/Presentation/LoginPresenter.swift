//
//  LoginPresenter.swift
//  Viperion
//
//  Created by Javier García López on 17/6/21.
//

import Foundation

protocol LoginPresenter {
    func doLogin(username: String, password: String)
}

protocol LoginPresenterOutput: AnyObject {
    func loginFailed(showError: String)
}

final class LoginPresenterImpl: LoginPresenter {
    func doLogin(username: String, password: String) {
        // TODO
    }
}
