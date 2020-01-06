//
//  AddedChannelViewController.swift
//  mvvmc-example
//
//  Created by Artur Carneiro on 05/01/20.
//  Copyright © 2020 Artur Carneiro. All rights reserved.
//

import UIKit

final class AddedChannelViewController: UIViewController {

    private lazy var name: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var date: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var tags: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var viewModel: AddedChannelViewModel

    init(viewModel: AddedChannelViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray

        name.textAlignment = .center
        date.textAlignment = .center
        tags.textAlignment = .center

        view.addSubview(name)
        view.addSubview(date)
        view.addSubview(tags)

        name.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        name.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        name.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        name.heightAnchor.constraint(equalToConstant: 50).isActive = true

        date.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        date.topAnchor.constraint(equalTo: name.bottomAnchor).isActive = true
        date.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        date.heightAnchor.constraint(equalToConstant: 50).isActive = true

        tags.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tags.topAnchor.constraint(equalTo: date.bottomAnchor).isActive = true
        tags.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        tags.heightAnchor.constraint(equalToConstant: 50).isActive = true

        update()

    }

    func update() {
        self.navigationItem.title = viewModel.name.uppercased()
        name.text = viewModel.name
        date.text = viewModel.date
        tags.text = viewModel.tags
    }

}
