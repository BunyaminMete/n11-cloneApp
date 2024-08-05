//
//  GuestAccountVC.swift
//  n11-cloneApp
//
//  Created by Bünyamin Mete on 1.08.2024.
//

import UIKit

class GuestAccountVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        // MARK:  - Navigation Bar
        let navigationBar = UINavigationBar()
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.overrideUserInterfaceStyle = .light

        
        let navItem = UINavigationItem()
        navigationBar.setItems([navItem], animated: false)
        
        self.view.addSubview(navigationBar)
        
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: view.superview?.topAnchor ?? view.topAnchor),
            navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationBar.heightAnchor.constraint(equalToConstant: 120)
        ])
        // MARK: Navigation Label
        let titleLabel = UILabel()
        titleLabel.text = "Hesabım"
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: -12),
            titleLabel.leadingAnchor.constraint(equalTo: navigationBar.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: navigationBar.trailingAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: navigationBar.centerXAnchor)
        ])
        
        // MARK: First Seperator
        let separator = UIView()
        separator.backgroundColor = .systemGray
        separator.alpha = 0.1
        separator.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.addSubview(separator)
        
        NSLayoutConstraint.activate([
            separator.leadingAnchor.constraint(equalTo: navigationBar.leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: navigationBar.trailingAnchor),
            separator.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 8),
            separator.heightAnchor.constraint(equalToConstant: 8)
        ])
        
        // MARK: - UIView for Authentication
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        view.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 0),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            contentView.heightAnchor.constraint(equalToConstant: 180)
        ])
        
        let multilineLabel = UILabel()
        multilineLabel.numberOfLines = 0
        multilineLabel.text = "Sana özel kampanyalardan & kuponlardan yararlanmak ve siparişlerinin durumunu takip etmek için giriş yap."
        multilineLabel.textColor = .black
        multilineLabel.font = UIFont.boldSystemFont(ofSize: 14)
        multilineLabel.textAlignment = .left
        multilineLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(multilineLabel)
        
        NSLayoutConstraint.activate([
            multilineLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            multilineLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            multilineLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15)
        ])
        
        let hexColorPurple = UIColor(hex: "5D3BBB")
        
        // MARK: UIButtons
        let signUpButton = UIButton(type: .system)
        signUpButton.setTitle("Üye Ol", for: .normal)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.tintColor = hexColorPurple
        signUpButton.layer.borderColor = hexColorPurple.cgColor
        signUpButton.layer.borderWidth = 1
        signUpButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        signUpButton.layer.cornerRadius = 10
        
        contentView.addSubview(signUpButton)
        
        let loginButton = UIButton(type: .system)
        loginButton.setTitle("Giriş Yap", for: .normal)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.backgroundColor = UIColor(named: "purple11")
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        loginButton.layer.cornerRadius = 10
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true // Sabit yükseklik
        contentView.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: multilineLabel.bottomAnchor, constant: 5),
            signUpButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            signUpButton.trailingAnchor.constraint(equalTo: loginButton.leadingAnchor, constant: -10),
            signUpButton.widthAnchor.constraint(equalTo: loginButton.widthAnchor),
            signUpButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: multilineLabel.bottomAnchor, constant: 5),
            loginButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            loginButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
        
        
        // MARK: - Second Seperator
        
        let separatorSecond = UIView()
        separatorSecond.backgroundColor = .systemGray
        separatorSecond.alpha = 0.1
        separatorSecond.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.addSubview(separatorSecond)
        
        NSLayoutConstraint.activate([
            separatorSecond.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            separatorSecond.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            separatorSecond.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 8),
            separatorSecond.heightAnchor.constraint(equalToConstant: 8) // Separator yüksekliği
        ])
        
        // MARK: Help Panel
        

        
    }
}
