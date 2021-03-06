//
//  ViewController.swift
//  FoodTracker
//
//  Created by Caleb Wells on 4/16/18.
//  Copyright © 2018 Caleb Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Meal Name"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    let textField: UITextField = {
        let text = UITextField()
        text.placeholder = "Enter meal name"
        text.borderStyle = UITextBorderStyle.roundedRect
        return text
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Set default label text", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        return button
    }()
    
    let image: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "no-photo"))
        image.frame = CGRect(x: 0, y: 0, width: 320, height: 320)
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    @objc func handleButton() {
        label.text = "Meal Name"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        textField.delegate = self
        
        setUpStackView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        label.alpha = 0
        textField.alpha = 0
        button.frame.origin.x -= 150
        moveUP()
        fadeIn()
        moveIn()
    }
    
    func setUpStackView() {
        let stackView = UIStackView(arrangedSubviews: [label, textField, button, image])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 12
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -100)
        ])
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.widthAnchor.constraint(equalTo: stackView.widthAnchor).isActive = true
    }
    
    func moveUP() {
        UIView.animate(withDuration: 1.5, animations: {
            self.label.alpha = 1
            self.label.frame.origin.y += -50
        })
    }
    
    func fadeIn() {
        UIView.animate(withDuration: 1.5, delay: 1.0, options: [], animations: {
            self.textField.alpha = 1
        }, completion: nil)
    }
    
    func moveIn() {
        UIView.animate(withDuration: 1.2, delay: 1.5, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: [], animations: {
            self.button.frame.origin.x = 150
        }, completion: nil)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        label.text = textField.text
        textField.text = ""
    }
}

