//
//  AppTheme.swift
//  Scovil
//
//  Created by Josh Marasigan on 4/27/19.
//  Copyright © 2019 Josh Marasigan. All rights reserved.
//

import Foundation
import UIKit

struct AppTheme
{
    // MARK: - Singleton
    static let shared = AppTheme()
    
    // MARK: - Meta Properties
    let color = Color()
    
    // MARK: - Properties
    struct Color
    {
        let primary = UIColor(red: 229/255, green: 43/255, blue: 43/255, alpha: 1.0)
        let primaryLight = UIColor(red: 255/255, green: 127/255, blue: 127/255, alpha: 1.0)
    }
}
