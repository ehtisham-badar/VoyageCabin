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
}
