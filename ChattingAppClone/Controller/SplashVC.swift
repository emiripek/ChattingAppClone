//
//  ViewController.swift
//  ChattingAppClone
//
//  Created by Emirhan İpek on 1.08.2024.
//

import UIKit

final class SplashVC: UIViewController {
    
    @IBOutlet weak var fbButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var appleButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var existingAccountLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLabel()
    }
    
    private func setupLabel() {
        let fullText = "Existing account? Log in"
        let clickablePart = "Log in"
        
        // Use the UILabel extension method to set attributed text
        existingAccountLabel.setAttributedTextWithClickablePart(
            fullText: fullText,
            clickablePart: clickablePart,
            action: #selector(existingAccountLabelTapped),
            target: self
        )
    }
    
    // MARK: - Actions
    
    @IBAction func fbButtonTapped(_ sender: Any) {
    }
    @IBAction func googleButtonTapped(_ sender: Any) {
    }
    @IBAction func appleButtonTapped(_ sender: Any) {
    }
    @IBAction func signUpButtonTapped(_ sender: Any) {
    }
    
    @objc private func existingAccountLabelTapped(_ gesture: UITapGestureRecognizer) {
        guard let label = gesture.view as? UILabel, let text = label.text else { return }
        
        let fullText = NSString(string: text)
        let range = fullText.range(of: "Log in")
        
        if label.didTapAttributedTextInRange(range, gesture: gesture) {
            // Handle the tap on "Log in"
            print("Log in tapped")
            // You can perform a segue or any other action here
        }
    }
}

