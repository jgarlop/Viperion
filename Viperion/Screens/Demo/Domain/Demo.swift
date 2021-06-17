//
//  Demo.swift
//  Viperion
//
//  Created by Javier García López on 26/2/21.
//

import Foundation

protocol Demo {
    func retrieveNewString()
}

protocol DemoOutput: AnyObject {
    func retrieveNewStringSuccess(newString: String)
}

class DemoImpl: Demo {
    weak var output: DemoOutput?
    
    func retrieveNewString() {
        let string = "This is a just a demo module to show how VIPER works. Stay tuned!"
        output?.retrieveNewStringSuccess(newString: string)
    }
}
