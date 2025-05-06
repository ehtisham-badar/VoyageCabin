//
//  CustomTabBarViewController.swift
//  VoyageCabin
//
//  Created by APPLE on 04/05/2025.
//

import UIKit

class CustomTabBarController: UITabBarController {

    private let centerButton = UIButton()
    private var isMenuOpen = false
    private var menuButtons: [UIButton] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupCenterButton()
    }

    private func setupTabBar() {
        let path = UIBezierPath(
            roundedRect: CGRect(x: 0, y: -20, width: tabBar.bounds.width, height: tabBar.bounds.height + 20),
            cornerRadius: 32
        )

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.black.cgColor
        shapeLayer.shadowColor = UIColor.black.cgColor
        shapeLayer.shadowOffset = CGSize(width: 0, height: -2)
        shapeLayer.shadowOpacity = 0.3
        shapeLayer.shadowRadius = 10

        if let oldShape = tabBar.layer.sublayers?.first(where: { $0.name == "customTabBarShape" }) {
            oldShape.removeFromSuperlayer()
        }

        shapeLayer.name = "customTabBarShape"
        tabBar.layer.insertSublayer(shapeLayer, at: 0)

        tabBar.tintColor = UIColor.systemBlue
        tabBar.unselectedItemTintColor = UIColor.darkGray
        tabBar.backgroundColor = .clear
        tabBar.isTranslucent = true
        tabBar.barTintColor = .clear
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
    }

    private func setupCenterButton() {
        let size: CGFloat = 70
        centerButton.frame = CGRect(x: (view.bounds.width - size) / 2, y: tabBar.frame.origin.y - 60, width: size, height: size)
        centerButton.layer.cornerRadius = size / 2
        centerButton.backgroundColor = UIColor(red: 0.35, green: 0.63, blue: 0.98, alpha: 1.0)
        centerButton.setImage(UIImage(systemName: "plus")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 30, weight: .bold)), for: .normal)
        centerButton.layer.borderWidth = 6
        centerButton.layer.borderColor = UIColor.white.cgColor
        centerButton.tintColor = .white
        centerButton.addTarget(self, action: #selector(centerButtonTapped), for: .touchUpInside)

        view.addSubview(centerButton)
        view.bringSubviewToFront(centerButton)
    }

    @objc private func centerButtonTapped() {
        isMenuOpen.toggle()

        let symbolName = isMenuOpen ? "xmark" : "plus"
        centerButton.setImage(UIImage(systemName: symbolName)?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 30, weight: .bold)), for: .normal)

        if isMenuOpen {
            showMenuButtons()
        } else {
            hideMenuButtons()
        }
    }

    private func showMenuButtons() {
        let icons = ["listrenter", "searchcenter", "listaproperty"] // system images
        let buttonSize: CGFloat = 50
        let spacing: CGFloat = 70

        for (i, icon) in icons.enumerated() {
            let button = UIButton(type: .system)
            button.frame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
            button.layer.cornerRadius = buttonSize / 2
            button.backgroundColor = UIColor.white
            button.setImage(UIImage(named: icon), for: .normal)
            button.center = centerButton.center
            button.alpha = 0

            // Animate upward in arc or line
            let targetY = centerButton.center.y - CGFloat(i + 1) * spacing

            view.addSubview(button)
            view.bringSubviewToFront(button)
            menuButtons.append(button)

            UIView.animate(withDuration: 0.3, delay: Double(i) * 0.05, options: .curveEaseOut, animations: {
                button.center = CGPoint(x: self.centerButton.center.x, y: targetY)
                button.alpha = 1
            }, completion: nil)
        }
    }

    private func hideMenuButtons() {
        for (i, button) in menuButtons.enumerated().reversed() {
            UIView.animate(withDuration: 0.3, delay: Double(menuButtons.count - 1 - i) * 0.05, options: .curveEaseIn, animations: {
                button.center = self.centerButton.center
                button.alpha = 0
            }, completion: { _ in
                button.removeFromSuperview()
            })
        }
        menuButtons.removeAll()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        setupTabBar()

        let size: CGFloat = 70
        centerButton.frame = CGRect(x: (view.bounds.width - size) / 2, y: tabBar.frame.origin.y - 60, width: size, height: size)
    }
}
