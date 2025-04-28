//
//  FindPropertyAdViewController.swift
//  VoyageCabin
//
//  Created by APPLE on 28/04/2025.
//

import UIKit

class FindPropertyAdViewController: UIViewController {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    func setView(){
        lblTitle.attributedText = Utils.attributedString(fullText: "Find Your \n Ideal Property \n Faster & Smarter \n with Insights", coloredPart: "Faster & Smarter", color: UIColor.appColor!, font: UIFont.plusJakartaSansBold(size: 32)!)
    }
    @IBAction func onCliclkContinue(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Onboard", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: String(describing: HearAboutUsViewController.self)) as? HearAboutUsViewController else {
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
