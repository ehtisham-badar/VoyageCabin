//
//  PreviewScreenViewController.swift
//  VoyageCabin
//
//  Created by APPLE on 11/05/2025.
//

import UIKit

class PreviewScreenViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
    }
    
    func registerNibs(){
        tableView.register(UINib(nibName: String(describing: PreviewHeaderTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: PreviewHeaderTableViewCell.self))
    }
    @IBAction func onClickNext(_ sender: Any) {//publish
        
    }
}

extension PreviewScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PreviewHeaderTableViewCell.self)) as? PreviewHeaderTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
