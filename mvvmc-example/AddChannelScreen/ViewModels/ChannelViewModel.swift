//
//  Channel.swift
//  mvvmc-example
//
//  Created by Artur Carneiro on 01/01/20.
//  Copyright © 2020 Artur Carneiro. All rights reserved.
//

import Foundation

final class ChannelViewModel {
    private let interactor: ChannelInteractor
    private let coordinator: RootCoordinator

    init(interactor: ChannelInteractor, coordinator: RootCoordinator) {
        self.interactor = interactor
        self.coordinator = coordinator
    }

    var name: String = "" {
        didSet {
            name = name.lowercased()
        }
    }

    var date: String = "" {
        didSet {
            date = date.replacingOccurrences(of: "-", with: " ", options: NSString.CompareOptions.literal, range: nil)
        }
    }

    var tags: String = ""

    func submit() {
        let model = ChannelModel(name: name, date: date, tags: tags)
        interactor.save(model: model)
        coordinator.addedChannel()
    }
}
