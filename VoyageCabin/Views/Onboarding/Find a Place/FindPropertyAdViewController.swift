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
}
