//
//  OnboardingAdViewController.swift
//  VoyageCabin
//
//  Created by APPLE on 28/04/2025.
//

import UIKit

class OnboardingAdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func onClickContinue(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Onboard", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: String(describing: ChallengeViewController.self)) as? ChallengeViewController else {
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
