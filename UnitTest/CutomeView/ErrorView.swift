//
//  ErrorView.swift
//  UnitTest
//
//  Created by hany karam on 9/20/21.
//

import UIKit

class ErrorView: UIView {
    let errorImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 75, height: 75))
    let messageLabel = UILabel()

    init(frame: CGRect = CGRect(x: 0, y: 0, width: 300, height: 300), errorImage: UIImage, errorMessage: String) {
        super.init(frame: frame)

        self.translatesAutoresizingMaskIntoConstraints = false
        errorImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(errorImageView)
        errorImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        errorImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        errorImageView.image = errorImage

        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        self.addSubview(messageLabel)
        messageLabel.topAnchor.constraint(equalTo: errorImageView.bottomAnchor, constant: 20).isActive = true
        messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        messageLabel.text = errorMessage
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

enum ErrorState {
    case hidden
    case shown(UIImage, String)
}
