//
//  ViewController.swift
//  SumUp
//
//  Created by Marin Rados on 06/05/2018.
//  Copyright © 2018 Marin Rados. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var sumUpButton: UIButton!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)
        style()
    }
    
    //MARK: - User Interactions
    
    @IBAction func sumUpButtonTapped(_ sender: Any) {
        guard let firstString = firstTextField.text, let firstNumber = Int(firstString) else {
            showAlert(with: "Please insert both numbers!")
            return
        }
        guard let secondString = secondTextField.text, let secondNumber = Int(secondString) else {
            showAlert(with: "Please insert both numbers!")
            return
        }
        if firstNumber > secondNumber {
            showAlert(with: "First number should not be higher than the second!")
            return
        }
        
        var sum = 0
        for number in firstNumber...secondNumber {
            sum += number
        }
        resultLabel.text = "\(sum)"
    }
    
    //MARK: - Style
    
    private func style() {
        addGradient()
        firstTextField.keyboardType = .numberPad
        secondTextField.keyboardType = .numberPad
        resultLabel.font = UIFont.systemFont(ofSize: 46)
        resultLabel.textAlignment = .center
        sumUpButton.setTitle("SUM UP", for: .normal)
        sumUpButton.tintColor = .white
        sumUpButton.backgroundColor = .red
        sumUpButton.layer.cornerRadius = 10
    }
    
    private func addGradient() {
        let bottomColor = UIColor(red: 23 / 255, green: 23 / 255, blue: 23 / 255, alpha: 1).cgColor
        let topColor = UIColor(red: 34 / 255, green: 12 / 255, blue: 23 / 255, alpha: 1).cgColor
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [topColor, bottomColor]
        gradient.locations = [0.0, 1.0]
        view.layer.insertSublayer(gradient, at: 0)
    }
    
    //MARK: - Utility
    
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        firstTextField.resignFirstResponder()
        secondTextField.resignFirstResponder()
    }
    
    private func showAlert(with message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

