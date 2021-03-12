//
//  DemoVC.swift
//  Viperion
//
//  Created by Javier García López on 19/2/21.
//

import UIKit

final class DemoVC: UIViewController {
    var presenter: DemoPresenter

    // MARK: Views

    private lazy var titleLabel: UILabel = {
        let view =  UILabel()
        view.text = NSLocalizedString("success", comment: "")
        view.textColor = UIColor.red
        return view
    }()

    private lazy var subtitleLabel: UILabel = {
        let view = UILabel()
        view.text = NSLocalizedString("demo_title", comment: "")
        view.textColor = UIColor.gray
        view.textAlignment = .center
        view.numberOfLines = 0
        return view
    }()

    private lazy var changeTextButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle(NSLocalizedString("change_text_button_title", comment: ""), for: .normal)
        view.addAction(UIAction(handler: { [weak self] action in
            self?.presenter.getNewString()
        }), for: .touchUpInside)
        return view
    }()

    // MARK: Init

    init(presenter: DemoPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: UI
extension DemoVC {
    private func setupUI() {
        setupNav()
        setupMain()
        setupConstraints()
    }

    private func setupNav() {
        navigationController?.navigationBar.isHidden = true
    }

    private func setupMain() {
        view.backgroundColor = UIColor.white
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(changeTextButton)
    }

    private func setupConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4.0).isActive = true
        subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4.0).isActive = true
        subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -4.0).isActive = true

        changeTextButton.translatesAutoresizingMaskIntoConstraints = false
        changeTextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        changeTextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20.0).isActive = true
    }
}

// MARK: Presenter outputs
extension DemoVC: DemoPresenterOutput {
    func showNewString(_ string: String) {
        subtitleLabel.text = string
    }

    func enableButton(_ enabled: Bool) {
        changeTextButton.isEnabled = enabled
    }
}
