//
//  LogInVC.swift
//  ChattingAppClone
//
//  Created by Emirhan İpek on 4.08.2024.
//

import UIKit

final class LogInVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureEmailTextField()
        configurePasswordTextField()
    }
    
    private func configureEmailTextField() {
        emailTextField.font = UIFont.systemFont(ofSize: 16)
        emailTextField.textColor = UIColor.clrBlack
        addBottomBorder(to: emailTextField)
    }
    
    private func configurePasswordTextField() {
        passwordTextField.font = UIFont.systemFont(ofSize: 16)
        passwordTextField.textColor = UIColor.clrBlack
        passwordTextField.isSecureTextEntry = true
        addBottomBorder(to: passwordTextField)
    }
    
    // Function to add bottom border to text fields
    private func addBottomBorder(to textField: UITextField) {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: textField.frame.height - 1, width: textField.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.clrLightGray.cgColor
        
        textField.borderStyle = .none
        textField.layer.addSublayer(bottomLine)
    }
    
    // MARK: - Action
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func fbButtonTapped(_ sender: Any) {
    }
    @IBAction func googleButtonTapped(_ sender: Any) {
    }
    @IBAction func appleButtonTapped(_ sender: Any) {
    }
    @IBAction func logInButtonTapped(_ sender: Any) {
    }
    
}
