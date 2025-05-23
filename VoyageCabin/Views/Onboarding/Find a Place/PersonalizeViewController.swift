//
//  PersonalizeViewController.swift
//  VoyageCabin
//
//  Created by APPLE on 28/04/2025.
//

import UIKit

class PersonalizeViewController: UIViewController {
    
    @IBOutlet weak var animatedCountingLabel: UILabel!
    @IBOutlet weak var circularProgressBarView: CircularProgressView!
    
    @IBOutlet weak var manload: UIImageView!
    var currentProgress: CGFloat = 0.0
    var timer: Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        completeOnboarding()
        updateProgress(to: 0)
        startLoading()
        manload.image = UIImage.gif(name: "manload")
    }
    func updateProgress(to value: CGFloat, duration: TimeInterval = 0.5) {
        UIView.animate(withDuration: duration) {
            self.circularProgressBarView.progress = value
        }
    }
    func startLoading() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            self.currentProgress += 0.01
            self.updateProgress(to: self.currentProgress)
            self.animatedCountingLabel.text = "\(Int(self.currentProgress * 100))%"
            if self.currentProgress >= 1.0 {
                self.timer?.invalidate()
                self.timer = nil
                self.loadingDidComplete()
            }
        }
    }
    func loadingDidComplete() {
        let storyboard = UIStoryboard(name: "Auth", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: String(describing: AuthController.self)) as? AuthController else {
            return
        }
        vc.shouldBackViewHide = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func completeOnboarding(){
        let lookingForAPlaceBody = Constants.lookingForAPlaceBody
        let lookingForHouseMateBody = Constants.lookingForHousemate
        APIManager.shared.postData(endpoint: Constants.selectedStatus == .lookingForAPlace ? .property_seeker_onboarding : .property_lister_onboarding, requestBody: Constants.selectedStatus == .lookingForAPlace ? lookingForAPlaceBody : lookingForHouseMateBody, viewController: self) { (code, result: APIResult<ResultResponse>) in
            switch result {
            case .success(_):
                DispatchQueue.main.async {
                    if code == 200 {
                        
                    }else {
                        AlertManager.shared.showAlert(on: self, message: "Failed", actionText: "OK") {}
                    }
                }
            case .failure(_):
                AlertManager.shared.showAlert(on: self, message: "Failed", actionText: "OK") {}
            }
        }
    }
    
    @IBAction func onClickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

import UIKit

class CircularProgressView: UIView {
    
    private let progressLayer = CAShapeLayer()
    private let trackLayer = CAShapeLayer()
    
    var progress: CGFloat = 0 {
        didSet {
            setProgress(progress)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayers()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayers()
    }
    
    private func setupLayers() {
        let strokeWidth: CGFloat = 10
        let radius = (min(bounds.width, bounds.height) - strokeWidth) / 2
        let centerPoint = CGPoint(x: bounds.midX, y: bounds.midY)

        let circularPath = UIBezierPath(
            arcCenter: centerPoint,
            radius: radius,
            startAngle: -.pi / 2,
            endAngle: 1.5 * .pi,
            clockwise: true
        )

        // Track layer (gray)
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.greyStrokeColor?.cgColor
        trackLayer.lineWidth = strokeWidth
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = .round
        trackLayer.frame = bounds
        layer.addSublayer(trackLayer)

        // Progress layer (blue)
        progressLayer.path = circularPath.cgPath
        progressLayer.strokeColor = UIColor.appColor?.cgColor
        progressLayer.lineWidth = strokeWidth
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .round
        progressLayer.strokeEnd = 0
        progressLayer.frame = bounds
        layer.addSublayer(progressLayer)
    }
    
    private func setProgress(_ progress: CGFloat) {
        let clampedProgress = max(0, min(progress, 1))
        progressLayer.strokeEnd = clampedProgress
    }
}
