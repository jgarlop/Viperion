//
//  MainVC.swift
//  Viperion
//
//  Created by Javier García López on 19/2/21.
//

import UIKit

final class MainVC: UIViewController {
    private lazy var label: UILabel = {
        let view =  UILabel()
        view.text = NSLocalizedString("success", comment: "")
        view.textColor = UIColor.red
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = UIColor.white
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
