//
//  Coordinator.swift
//  Scovil
//
//  Created by Josh Marasigan on 4/27/19.
//  Copyright © 2019 Josh Marasigan. All rights reserved.
//

import Foundation
import UIKit

class Coordinator
{
    // MARK: - Properties
    private(set) var navController: MainNavigationController
    private let service: Service
    
    // MARK: - Init
    init(service: Service)
    {
        self.service = service
        self.navController = MainNavigationController()
    }
    
    // MARK: - Helpers
    func pushRootView() {
        let vc = ViewController()
        self.navController.pushViewController(vc, animated: true)
    }
    
}

