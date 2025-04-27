//
//  AuthController.swift
//  VoyageCabin
//
//  Created by APPLE on 27/04/2025.
//

import UIKit

class AuthController: UIViewController {
    
    @IBOutlet weak var lblTermsPrivacy: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTermsPrivacyLabel()
    }
    @IBAction func onClickBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setTermsPrivacyLabel() {
        let fullText = "By using Voyage Cabin, you are agreeing to our Terms & Conditions and acknowledge the Privacy Policy."
        let termsText = "Terms & Conditions"
        let privacyText = "Privacy Policy"
        
        let attributedString = NSMutableAttributedString(string: fullText)
        let fullRange = NSRange(location: 0, length: fullText.count)
        let termsRange = (fullText as NSString).range(of: termsText)
        let privacyRange = (fullText as NSString).range(of: privacyText)
        
        // Set default color for the whole text
        attributedString.addAttribute(.foregroundColor, value: UIColor.textPrimary, range: fullRange)
        
        // Set color for "Term of Service" and "Privacy Policy"
        attributedString.addAttribute(.foregroundColor, value: UIColor.appColor!, range: termsRange)
        attributedString.addAttribute(.foregroundColor, value: UIColor.appColor!, range: privacyRange)
        
        // Set attributed text to the label
        lblTermsPrivacy.attributedText = attributedString
        lblTermsPrivacy.isUserInteractionEnabled = true
        
        // Add gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapOnLabel(_:)))
        lblTermsPrivacy.addGestureRecognizer(tapGesture)
    }
    @objc func handleTapOnLabel(_ gesture: UITapGestureRecognizer) {
        guard let text = lblTermsPrivacy.attributedText?.string else { return }
        
        let termsText = "Term of Service"
        let privacyText = "Privacy Policy"
        
        let termsRange = (text as NSString).range(of: termsText)
        let privacyRange = (text as NSString).range(of: privacyText)
        
        if gesture.didTapAttributedTextInLabel(label: lblTermsPrivacy, inRange: termsRange) {
            print("Term of Service tapped")
        } else if gesture.didTapAttributedTextInLabel(label: lblTermsPrivacy, inRange: privacyRange) {
            print("Privacy Policy tapped")
        } else {
            print("unidentified")
        }
    }
}
