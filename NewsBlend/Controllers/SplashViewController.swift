//
//  SplashViewController.swift
//  NewsBlend
//
//  Created by Abdullah Jaswal on 13/10/2024.
//

import UIKit

class SplashViewController: UIViewController {
    private let logoImageView: UIImageView = {
        let config = UIImage.SymbolConfiguration(pointSize: 100, weight: .bold, scale: .large)
        let imageView = UIImageView(image: UIImage(systemName: "tornado", withConfiguration: config))

        imageView.tintColor = UIColor.systemYellow
        imageView.translatesAutoresizingMaskIntoConstraints = false

        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowOffset = CGSize(width: 5, height: 5)
        imageView.layer.shadowRadius = 20
        imageView.layer.shadowOpacity = 0.05

        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        var descriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .title1).withDesign(.rounded) ?? UIFontDescriptor.preferredFontDescriptor(withTextStyle: .title1)

        label.text = "NewsBlend"

        descriptor = descriptor.withSymbolicTraits(.traitBold) ?? descriptor
        label.font = UIFont(descriptor: descriptor, size: 32)

        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOffset = CGSize(width: 5, height: 5)
        label.layer.shadowRadius = 20
        label.layer.shadowOpacity = 0.05

        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        startAnimation()
    }

    private func setupView() {
        view.backgroundColor = UIColor.systemBackground

        view.addSubview(logoImageView)
        view.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30),
            logoImageView.widthAnchor.constraint(equalToConstant: 150),
            logoImageView.heightAnchor.constraint(equalToConstant: 150),

            titleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 60),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    private func startAnimation() {
        logoImageView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)

        UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.logoImageView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }) { _ in
            UIView.animate(withDuration: 0.5) {
                self.logoImageView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                self.logoImageView.alpha = 0
                self.titleLabel.alpha = 0
            } completion: { _ in
                self.finishSplashAnimation()
            }
        }
    }

    private func finishSplashAnimation() {
        UIView.animate(withDuration: 0.5) {
            self.view.alpha = 0
        } completion: { _ in
            self.view.removeFromSuperview()
        }
    }
}
