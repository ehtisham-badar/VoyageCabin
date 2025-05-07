//
//  OpenPickerPhotoViewController.swift
//  VoyageCabin
//
//  Created by APPLE on 07/05/2025.
//

import UIKit

class OpenPickerPhotoViewController: UIViewController {

    @IBOutlet weak var blurView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        self.blurView.addGestureRecognizer(tap)
    }
    @objc func dismissView() {
        self.dismiss(animated: true)
    }
    @IBAction func onClickTakePic(_ sender: Any) {
        PhotoPicker.shared.delegate = self
        PhotoPicker.shared.capturePhoto(with: self)
    }
    
    @IBAction func onClickGallery(_ sender: Any) {
        PhotoPicker.shared.delegate = self
        PhotoPicker.shared.pickPhoto(with: self)
    }
}

extension OpenPickerPhotoViewController: PhotoPickerDelegate {
    func didFinish(image: UIImage) {
        
    }
}
