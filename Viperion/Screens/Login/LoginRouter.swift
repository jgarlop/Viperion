//
//  LoginRouter.swift
//  Viperion
//
//  Created by Javier García López on 17/6/21.
//
import Foundation

final class LoginRouter {
    static func assemble() -> LoginVC {
        let presenter = LoginPresenterImpl()
        let vc = LoginVC(presenter: presenter)

        return vc
    }
}
