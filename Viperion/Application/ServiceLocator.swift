//
//  ServiceLocator.swift
//  Viperion
//
//  Created by Javier García López on 26/2/21.
//

import Foundation

protocol ServiceLocator {
    var appRouter: AppRouter { get }
}

final class ServiceLocatorImpl: ServiceLocator {
    lazy var appRouter: AppRouter = AppRouterImpl()
}
