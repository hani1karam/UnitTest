//
//  LoaderView.swift
//  UnitTest
//
//  Created by hany karam on 9/20/21.
//

import NVActivityIndicatorView

class LoaderView: UIView {
    var indicator: NVActivityIndicatorView!
    var messageLabel: UILabel = UILabel()
    
    init(frame: CGRect = CGRect(x: 0, y: 0, width: 200, height: 200), color: UIColor = .black) {
        super.init(frame: frame)
        self.indicator = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 75, height: 75), type: .circleStrokeSpin, color: color)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(self.indicator)
        indicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        indicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        messageLabel.text = "Please wait ..."
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(messageLabel)
        messageLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        messageLabel.topAnchor.constraint(equalTo: indicator.bottomAnchor, constant: 20).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startAnimating() {
        indicator.startAnimating()
        messageLabel.isHidden = false
    }
    
    func stopAnimating() {
        indicator.stopAnimating()
        messageLabel.isHidden = true
    }
}

enum LoaderState {
    case shown
    case hidden
}
