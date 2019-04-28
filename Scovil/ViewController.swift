//
//  ViewController.swift
//  Scovil
//
//  Created by Josh Marasigan on 4/27/19.
//  Copyright © 2019 Josh Marasigan. All rights reserved.
//

import UIKit

// Note: - Replace this initial view with a loading/logo screen.
class ViewController: UIViewController {

    // MARK: - Properties
    
    // MARK: - VC Lifecycle
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.navigationController?
            .setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        self.navigationController?
            .setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.configUI()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - UI
    private func configUI()
    {
        self.setBackgroundColor()
    }
    
    private func setBackgroundColor()
    {
        let gradientBackgroundColor = CAGradientLayer()
        gradientBackgroundColor.frame = self.view.bounds
        gradientBackgroundColor.colors = [AppTheme.shared.color.primary.cgColor,
                                          AppTheme.shared.color.primaryLight.cgColor]
        gradientBackgroundColor.startPoint = CGPoint(x: 1, y: 0)
        gradientBackgroundColor.endPoint = CGPoint(x: 1, y: 1)
        self.view.layer.addSublayer(gradientBackgroundColor)
    }
}
