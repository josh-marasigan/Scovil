//
//  ViewController.swift
//  Scovil
//
//  Created by Josh Marasigan on 4/27/19.
//  Copyright © 2019 Josh Marasigan. All rights reserved.
//

import UIKit
import SnapKit

// Note: - Replace this initial view with a loading/logo screen.
class ViewController: UIViewController {

    // MARK: - Properties
    private lazy var topLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 36)
        label.textColor = UIColor.white
        label.text = "It's"
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    private lazy var bottomLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 48)
        label.textColor = UIColor.white
        label.text = "Lit"
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
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
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.5) {
            self.animateIn()
        }
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
        self.resetAnimations()
        
        self.view.addSubview(self.topLabel)
        self.topLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
                .offset(UIScreen.main.bounds.height / 4)
            make.centerX.equalToSuperview()
        }
        
        self.view.addSubview(self.bottomLabel)
        self.bottomLabel.snp.makeConstraints { make in
            make.top.equalTo(self.topLabel.snp.bottom)
            make.centerX.equalTo(self.topLabel)
            make.bottom.lessThanOrEqualToSuperview()
        }
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
    
    // MARK: - Animation
    private func resetAnimations()
    {
        self.topLabel.alpha = 0.0
        self.bottomLabel.alpha = 0.0
        self.topLabel.transform = CGAffineTransform(translationX: 0.0, y: -32.0)
        self.bottomLabel.transform = CGAffineTransform(translationX: 0.0, y: -32.0)
    }
    
    private func animateIn()
    {
        UIView.animate(
            withDuration: 0.4,
            delay: 0.0,
            usingSpringWithDamping: 1.0,
            initialSpringVelocity: 1.5,
            options: .curveEaseIn,
            animations:
            { [weak self] in
                guard let self = self else { return }
                self.topLabel.alpha = 1.0
                self.topLabel.transform = .identity
                self.view.layoutIfNeeded()
                
        }) { _ in
            
            UIView.animate(
                withDuration: 0.4,
                delay: 0.0,
                usingSpringWithDamping: 1.0,
                initialSpringVelocity: 1.5,
                options: .curveEaseIn,
                animations:
                { [weak self] in
                    guard let self = self else { return }
                    self.bottomLabel.alpha = 1.0
                    self.bottomLabel.transform = .identity
                    self.view.layoutIfNeeded()
            })
        }
    }
}
