//
//  ViewController.swift
//  PostApp
//
//  Created by Тарас Коваль on 26.04.24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var saveEditButton: UIButton!

    @IBOutlet weak var postFoto: UIImageView!
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        
        textField.layer.borderColor = UIColor(named: "mainBlue30")?.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 8
        textField.setLeftPaddingPoints(10)
        
        postFoto.layer.cornerRadius = 8
        
        saveEditButton.layer.cornerRadius = 8
        saveEditButton.applyGradient(colors: [UIColor(red: 0.02, green: 0.33, blue: 0.69, alpha: 0.30).cgColor, UIColor(red: 0.02, green: 0.33, blue: 0.69, alpha: 0.20).cgColor, UIColor(red: 0.02, green: 0.33, blue: 0.69, alpha: 0.30).cgColor])
        super.viewDidLoad()
    }
    
}

extension UIButton {
    func applyGradient(colors : [CGColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.cornerRadius = layer.cornerRadius
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        gradientLayer.locations = [0,0.5,1]
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
