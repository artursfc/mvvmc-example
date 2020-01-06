//
//  AddedChannelViewModel.swift
//  mvvmc-example
//
//  Created by Artur Carneiro on 05/01/20.
//  Copyright © 2020 Artur Carneiro. All rights reserved.
//

import Foundation

final class AddedChannelViewModel {
    private let interactor: AddedChannelInteractor
    private let coordinator: Coordinator

    private var model: ChannelModel

    init(interactor: AddedChannelInteractor, coordinator: Coordinator) {
        self.interactor = interactor
        self.coordinator = coordinator
        model = interactor.fetch()
    }

    var name: String {
        return model.name
    }

    var date: String {
        return model.date
    }

    var tags: String {
        return model.tags
    }

    func update() {
        model = interactor.fetch()
    }

}
