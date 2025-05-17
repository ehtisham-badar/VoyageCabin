//
//  WriteNotesViewController.swift
//  VoyageCabin
//
//  Created by APPLE on 10/05/2025.
//

import UIKit

class WriteNotesViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func onClickNext(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Renter", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: String(describing: SelectLocationViewController.self)) as? SelectLocationViewController else {
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func onClickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
