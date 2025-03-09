//
//  ViewController.swift
//  ChattingAppClone
//
//  Created by Emirhan İpek on 1.08.2024.
//

import UIKit

final class SplashVC: UIViewController {
    
    @IBOutlet weak var existingAccountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureExistingAccountLabel()
    }
    
    private func configureExistingAccountLabel() {
        let fullText = "Existing account? Log in"
        let clickablePart = "Log in"
        
        existingAccountLabel.setAttributedTextWithClickablePart(
            fullText: fullText,
            clickablePart: clickablePart,
            action: #selector(existingAccountLabelTapped),
            target: self
        )
    }
    
    // MARK: - Actions
    
    @IBAction func facebookButtonTapped(_ sender: Any) {
    }
    
    @IBAction func gmailButtonTapped(_ sender: Any) {
    }
    
    @IBAction func appleButtonTapped(_ sender: Any) {
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        if let signUpVC = storyboard?.instantiateViewController(identifier: "ToSignUpVC") {
            navigationController?.pushViewController(signUpVC, animated: true)
        }
    }
    
    
    @objc private func existingAccountLabelTapped(_ gesture: UITapGestureRecognizer) {
        guard let label = gesture.view as? UILabel, let text = label.text else { return }
        
        let fullText = NSString(string: text)
        let range = fullText.range(of: "Log in")
        
        if label.didTapAttributedTextInRange(range, gesture: gesture) {
            // Handle the tap on "Log in"
            navigateToSignInVC()
            // You can perform a segue or any other action here
        }
    }
    
    private func navigateToSignInVC() {
        if let logInVC = storyboard?.instantiateViewController(identifier: "ToLogInVC") {
            navigationController?.pushViewController(logInVC, animated: true)
        }
    }
}

