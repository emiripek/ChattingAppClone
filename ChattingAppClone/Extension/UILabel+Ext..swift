//
//  UILabel+Ext..swift
//  ChattingAppClone
//
//  Created by Emirhan İpek on 4.08.2024.
//

import UIKit

extension UILabel {
    
    // Method to set attributed text with a clickable part
    func setAttributedTextWithClickablePart(fullText: String, clickablePart: String, clickablePartColor: UIColor = .clrWhite, clickablePartFont: UIFont = .boldSystemFont(ofSize: 14), defaultFont: UIFont = .systemFont(ofSize: 14), action: Selector, target: Any) {
        
        // Create an attributed string with the full text
        let attributedText = NSMutableAttributedString(string: fullText)
        
        // Set the default font for the entire string
        attributedText.addAttribute(.font, value: defaultFont, range: NSRange(location: 0, length: fullText.count))
        
        // Find the range of the clickable part
        let clickableRange = (fullText as NSString).range(of: clickablePart)
        
        // Set the font and color for the clickable part
        attributedText.addAttribute(.font, value: clickablePartFont, range: clickableRange)
        attributedText.addAttribute(.foregroundColor, value: clickablePartColor, range: clickableRange)
        
        // Assign the attributed text to the label
        self.attributedText = attributedText
        
        // Enable user interaction
        self.isUserInteractionEnabled = true
        
        // Add a tap gesture recognizer to the label
        let tapGesture = UITapGestureRecognizer(target: target, action: action)
        self.addGestureRecognizer(tapGesture)
    }
    
    // Helper method to detect tap on attributed text
    func didTapAttributedTextInRange(_ range: NSRange, gesture: UITapGestureRecognizer) -> Bool {
        guard let attributedText = self.attributedText else { return false }
        
        let textStorage = NSTextStorage(attributedString: attributedText)
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: self.bounds.size)
        textContainer.lineFragmentPadding = 0.0
        textContainer.maximumNumberOfLines = self.numberOfLines
        textContainer.lineBreakMode = self.lineBreakMode
        
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)
        
        let locationOfTouchInLabel = gesture.location(in: self)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        let textContainerOffset = CGPoint(
            x: (self.bounds.size.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x,
            y: (self.bounds.size.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y)
        let locationOfTouchInTextContainer = CGPoint(
            x: locationOfTouchInLabel.x - textContainerOffset.x,
            y: locationOfTouchInLabel.y - textContainerOffset.y)
        
        let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        return NSLocationInRange(indexOfCharacter, range)
    }
}
