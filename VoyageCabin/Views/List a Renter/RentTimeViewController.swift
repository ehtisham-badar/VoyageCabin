//
//  RentTimeViewController.swift
//  VoyageCabin
//
//  Created by APPLE on 11/05/2025.
//

import UIKit

class RentTimeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func onClickNext(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Renter", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: String(describing: PropertyRentViewController.self)) as? PropertyRentViewController else {
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func onClickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
