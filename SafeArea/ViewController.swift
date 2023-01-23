//
//  ViewController.swift
//  SafeArea
//
//  Created by Shah Md Imran Hossain on 22/1/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
    }

    func setupViews() {
        let topLabel = makeLabel(withText: "Top")
        let bottomLabel = makeLabel(withText: "Bottom")
        let leadingLabel = makeLabel(withText: "Leading")
        let trailingLabel = makeLabel(withText: "Trailing")
        
        view.addSubview(topLabel)
        view.addSubview(bottomLabel)
        view.addSubview(leadingLabel)
        view.addSubview(trailingLabel)
        
        // top
        NSLayoutConstraint.activate([
            // this will be hidden under status and navigation bar
            // topLabel.topAnchor.constraint(equalTo: view.topAnchor),
            // topLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // bottom
        NSLayoutConstraint.activate([
            //bottomLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // 8 pt spacing
        // top
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
            topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // bottom
        NSLayoutConstraint.activate([
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: bottomLabel.bottomAnchor, multiplier: 1),
            bottomLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        
        // no need of SafeAreaGuide for leading and trailing
        // leading / left
        NSLayoutConstraint.activate([
            leadingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            leadingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        // trailing / right
        NSLayoutConstraint.activate([
            // -8 cause subject is trailing label
            // trailingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            view.trailingAnchor.constraint(equalTo: trailingLabel.trailingAnchor, constant: 8),
            trailingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

// MARK: - Factory methods
extension ViewController {
    func makeLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.backgroundColor = .yellow
        label.font = UIFont.systemFont(ofSize: 32)
        
        return label
    }
}
