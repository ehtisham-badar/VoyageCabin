//
//  GetStartedViewController.swift
//  VoyageCabin
//
//  Created by APPLE on 27/04/2025.
//

import UIKit

class GetStartedViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnGetStarted: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    func setView() {
        btnGetStarted.cornerRadius = btnGetStarted.frame.height/2
        btnGetStarted.applyLinearGradient(color1: UIColor.gradient1color!, color2: UIColor.gradient2color!)
        lblTitle.attributedText = Utils.styledText(firstString: "Welcome to", secondString: "Voyage Cabin", font: UIFont.plusJakartaSansBold(size: 42)!)
    }
    @IBAction func onClickGetStarted(_ sender: Any) {
        
    }
    @IBAction func onClickLogin(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Auth", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: String(describing: AuthController.self)) as? AuthController else {
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
