//
//  MainNavigationController.swift
//  Scovil
//
//  Created by Josh Marasigan on 4/27/19.
//  Copyright © 2019 Josh Marasigan. All rights reserved.
//

import Foundation
import UIKit

class MainNavigationController : UINavigationController {
    
    // MARK: - UI
    private func setup()
    {
        let titleAttributes = [
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor : UIColor.white
        ]
        
        DispatchQueue.main.async { [weak self] in
            guard let `self` = self else { return }
            self.navigationBar.barTintColor = AppTheme.shared.color.primary
            self.navigationBar.titleTextAttributes = titleAttributes
            self.navigationBar.tintColor = UIColor.white
        }
    }
}
