//
//  LaunchScreenViewController.swift
//  VoyageCabin
//
//  Created by APPLE on 27/04/2025.
//

import UIKit

class LaunchScreenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            let storyboard = UIStoryboard(name: "Onboard", bundle: nil)
            guard let vc = storyboard.instantiateViewController(withIdentifier: String(describing: GetStartedViewController.self)) as? GetStartedViewController else {
                return
            }
            self.navigationController?.pushViewController(vc, animated: true)
        })
    }
}
