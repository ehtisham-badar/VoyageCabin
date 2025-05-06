//
//  ListRenterViewController.swift
//  VoyageCabin
//
//  Created by APPLE on 04/05/2025.
//

import UIKit

class ListRenterViewController: UIViewController {

    @IBOutlet weak var gifView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gifView.image = UIImage.gif(name: "listarenter")
    }
    @IBAction func onClickListaRenter(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Renter", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: String(describing: AboutYouViewController.self)) as? AboutYouViewController else {
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
