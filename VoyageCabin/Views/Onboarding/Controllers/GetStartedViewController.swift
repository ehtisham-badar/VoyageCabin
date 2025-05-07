//
//  GetStartedViewController.swift
//  VoyageCabin
//
//  Created by APPLE on 27/04/2025.
//

import UIKit

class GetStartedViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var getStartedView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    func setView() {
        getStartedView.cornerRadius = getStartedView.frame.height/2
//        getStartedView.applyLinearGradient(color1: UIColor.gradient1color!, color2: UIColor.gradient2color!)
        lblTitle.attributedText = Utils.styledText(firstString: "Welcome to", secondString: "Voyage Cabin", font: UIFont.plusJakartaSansBold(size: 42)!)
    }
    @IBAction func onClickGetStarted(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Onboard", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: String(describing: SelectOnboardingViewController.self)) as? SelectOnboardingViewController else {
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func onClickLogin(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Renter", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: String(describing: AboutYouViewController.self)) as? AboutYouViewController else {
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
