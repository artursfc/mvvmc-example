//
//  Coordinator.swift
//  mvvmc-example
//
//  Created by Artur Carneiro on 01/01/20.
//  Copyright © 2020 Artur Carneiro. All rights reserved.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
