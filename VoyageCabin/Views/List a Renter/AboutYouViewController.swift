//
//  AboutYouViewController.swift
//  VoyageCabin
//
//  Created by APPLE on 06/05/2025.
//

import UIKit

class AboutYouViewController: UIViewController {
    
    @IBOutlet weak var defaultView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
    }
    @IBAction func onClickNext(_ sender: Any) {
        defaultView.isHidden = true
        tableView.isHidden = false
    }
    func registerNibs() {
        tableView.register(UINib(nibName: String(describing: AboutYouTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: AboutYouTableViewCell.self))
    }
}

extension AboutYouViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: AboutYouTableViewCell.self)) as? AboutYouTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
