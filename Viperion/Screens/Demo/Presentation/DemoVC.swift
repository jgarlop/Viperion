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

    private lazy var titleLabel = UILabel().apply {
        $0.text = "success".localized
        $0.textColor = UIColor.red
    }

    private lazy var subtitleLabel = UILabel().apply {
        $0.text = "demo_title".localized
        $0.textColor = UIColor.gray
        $0.textAlignment = .center
        $0.numberOfLines = 0
    }

    private lazy var changeTextButton = UIButton(type: .system).apply {
        $0.setTitle("change_text_button_title".localized, for: .normal)
        $0.addAction(UIAction(handler: { [weak self] action in
            self?.presenter.getNewString()
        }), for: .touchUpInside)
    }

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
        view.addSubviews(titleLabel, subtitleLabel, changeTextButton)
    }

    private func setupConstraints() {
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }

        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.left.equalToSuperview().offset(4)
            $0.right.equalToSuperview().offset(-4)
        }

        changeTextButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-20)
        }
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
