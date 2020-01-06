//
//  RootCoordinator.swift
//  mvvmc-example
//
//  Created by Artur Carneiro on 01/01/20.
//  Copyright © 2020 Artur Carneiro. All rights reserved.
//

import UIKit

final class RootCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()

    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let interactor = ChannelInteractor()
        let viewModel = ChannelViewModel(interactor: interactor, coordinator: self)
        let vc = ChannelViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: false)
    }

    func addedChannel() {
        let interactor = AddedChannelInteractor()
        let viewModel = AddedChannelViewModel(interactor: interactor, coordinator: self)
        let vc = AddedChannelViewController(viewModel: viewModel)
        navigationController.pushViewController(vc, animated: true)
    }

}
