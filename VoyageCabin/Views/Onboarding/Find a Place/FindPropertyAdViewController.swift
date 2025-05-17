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
        setSubtitleLabel()
    }
    
    func setView(){
        lblTitle.attributedText = Utils.attributedString(fullText: "Find Your \n Ideal Property \n Faster & Smarter \n with Insights", coloredPart: "Faster & Smarter", color: UIColor.appColor!, font: UIFont.plusJakartaSansBold(size: 32)!)
        
    }
    func setSubtitleLabel() {
        let fullText = "No more guesswork \n see exactly who’s interested in your profile and \n connect with them instantly with our \n Insights feature \n \n We’re here to help!"
        let boldText1 = "No more guesswork"
        let boldText2 = "exactly who’s interested"
        let boldText3 = "connect with them instantly"
        let boldOrangeText = "Insights feature"
        
        let attributedString = NSMutableAttributedString(string: fullText)
        
        let fullRange = NSRange(location: 0, length: fullText.count)
        let boldRange1 = (fullText as NSString).range(of: boldText1)
        let boldRange2 = (fullText as NSString).range(of: boldText2)

        let boldRange3 = (fullText as NSString).range(of: boldText3)

        let boldOrangeRange = (fullText as NSString).range(of: boldOrangeText)
        
        // Set default font and color
        attributedString.addAttribute(.font, value: UIFont.plusJakartaSansRegular(size: 14), range: fullRange)
        attributedString.addAttribute(.foregroundColor, value: UIColor.black, range: fullRange)
        
        // Set bold font for "No more guesswork"
        attributedString.addAttribute(.font, value: UIFont.plusJakartaSansBold(size: 14)!, range: boldRange1)
        attributedString.addAttribute(.font, value: UIFont.plusJakartaSansBold(size: 14)!, range: boldRange2)
        attributedString.addAttribute(.font, value: UIFont.plusJakartaSansBold(size: 14)!, range: boldRange3)
        
        // Set bold + orange color for "Insights feature"
        attributedString.addAttributes([
            .font: UIFont.plusJakartaSansBold(size: 14)!,
            .foregroundColor: UIColor.hexStringToUIColor(hex: "#FF7A00")
        ], range: boldOrangeRange)
        
        lblSubtitle.attributedText = attributedString
    }
    @IBAction func onCliclkContinue(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Onboard", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: String(describing: HearAboutUsViewController.self)) as? HearAboutUsViewController else {
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
