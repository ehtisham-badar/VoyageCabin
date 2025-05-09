//
//  ProfessionalStatusViewController.swift
//  VoyageCabin
//
//  Created by APPLE on 07/05/2025.
//

import UIKit

class ProfessionalStatusViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let statusOptions = [
        "Working Full Time",
        "Working Part Time",
        "Working Holiday",
        "Retired",
        "Unemployed",
        "Backpacker",
        "Student"
    ]
    var selectedIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let spacing: CGFloat = 12
            let numberOfItemsPerRow: CGFloat = 2

            let totalSpacing = (numberOfItemsPerRow - 1) * spacing
            let horizontalInsets: CGFloat = spacing * 2 // 12 left + 12 right

            let itemWidth = (collectionView.bounds.width - totalSpacing - horizontalInsets) / numberOfItemsPerRow
            let itemHeight = 70.0 // Make square cells, adjust as needed

            layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
            layout.minimumLineSpacing = spacing
            layout.minimumInteritemSpacing = spacing
            layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
            layout.invalidateLayout()
        }
    }
    @IBAction func onClickNext(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Renter", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: String(describing: LifeStyleViewController.self)) as? LifeStyleViewController else {
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func registerNibs(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: String(describing: SelectionCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: SelectionCollectionViewCell.self))
    }
}

extension ProfessionalStatusViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return statusOptions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: SelectionCollectionViewCell.self), for: indexPath) as? SelectionCollectionViewCell else { return UICollectionViewCell() }
        cell.iconImage.image = UIImage(named: "iconps\(indexPath.item + 1)")
        cell.lblTitle.text = statusOptions[indexPath.item]
        if selectedIndex == indexPath.item {
            cell.mainView.borderColor = UIColor.appColor
            cell.mainView.borderWidth = 2
            cell.colorView.backgroundColor = UIColor.appColor
            cell.iconImage.tintColor = UIColor.white
        } else {
            cell.mainView.borderColor = UIColor.white
            cell.mainView.borderWidth = 2
            cell.colorView.backgroundColor = UIColor.white
            cell.iconImage.tintColor = UIColor.labeBlueColor
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.item
        self.collectionView.reloadData()
    }
}
