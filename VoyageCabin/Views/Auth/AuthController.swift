//
//  AuthController.swift
//  VoyageCabin
//
//  Created by APPLE on 27/04/2025.
//

import UIKit
import FirebaseCore
import GoogleSignIn
import FirebaseAuth
//import FBSDKLoginKit
import AuthenticationServices

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
    @IBAction func continuewithApple(_ sender: Any) {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()
    }
    @IBAction func continuewithFacebook(_ sender: Any) {
        
    }
    @IBAction func continuewithGoogle(_ sender: Any) {
        signInWithGoogle()
    }
    func signInWithGoogle() {
        self.navigateToProfile()
        return
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        let config = GIDConfiguration(clientID: clientID)
        
        GIDSignIn.sharedInstance.configuration = config
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
            guard error == nil else { return }
            guard let signInResult = signInResult else { return }
            
            let user = signInResult.user
            let idToken = user.idToken
            
            let accessToken = user.accessToken
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken?.tokenString ?? "", accessToken: accessToken.tokenString)
            
            let emailAddress = user.profile?.email
            
            let fullName = user.profile?.name ?? ""
            print(fullName)
            let givenName = user.profile?.givenName
            let familyName = user.profile?.familyName
            
            let profilePicUrl = user.profile?.imageURL(withDimension: 320)
            let username = (givenName ?? "") + (familyName ?? "")
            self.navigateToProfile()
            
        }
    }
    
    func navigateToProfile() {
        let storyboard = UIStoryboard(name: "Profile", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: String(describing: ProfileViewController.self)) as? ProfileViewController else {
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension AuthController: ASAuthorizationControllerDelegate,ASAuthorizationControllerPresentationContextProviding{
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        ASPresentationAnchor()
    }
}
