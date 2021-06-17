//
//  LoginVC.swift
//  Viperion
//
//  Created by Javier García López on 17/6/21.
//

import UIKit

final class LoginVC: UIViewController {
    var presenter: LoginPresenter
    
    // MARK: Views
    private lazy var mainContainerView = UIView()

    private lazy var loginLogo = UIImageView().apply {
        $0.image = UIImage(named: "loginLogo")
        $0.contentMode = .scaleAspectFit
    }

    private lazy var usernameTextField = UITextField().apply {
        $0.placeholder = "Enter your username"
        $0.addImage(side: .left, image: UIImage(systemName: "envelope"), size: 20, padding: 8)
        $0.leftView?.tintColor = .darkGray
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.red.cgColor
        $0.layer.cornerRadius = 6
        $0.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
    }

    private lazy var passwordTextField = UITextField().apply {
        $0.placeholder = "Enter your password"
        $0.isSecureTextEntry = true
        $0.addImage(side: .left, image: UIImage(systemName: "lock.circle"), size: 20, padding: 8)
        $0.leftView?.tintColor = .darkGray
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.red.cgColor
        $0.layer.cornerRadius = 6
        $0.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
    }

    // MARK: Init

    init(presenter: LoginPresenter) {
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
extension LoginVC {
    private func setupUI() {
        setupMain()
        setupNav()
        setupConstraints()
    }

    private func setupNav() {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    private func setupMain() {
        view.backgroundColor = .white
        view.addSubviews(
            mainContainerView.addSubviews(
                loginLogo,
                usernameTextField,
                passwordTextField
            )
        )
    }

    private func setupConstraints() {
        mainContainerView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.right.equalToSuperview().inset(2.units)
        }

        loginLogo.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.size.equalTo(200)
            $0.centerX.equalToSuperview()
        }

        usernameTextField.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.equalTo(loginLogo.snp.bottom).offset(3.units)
            $0.height.equalTo(50)
        }

        passwordTextField.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.equalTo(usernameTextField.snp.bottom).offset(1.units)
            $0.height.equalTo(50)
            $0.bottom.equalToSuperview()
        }
    }
}
