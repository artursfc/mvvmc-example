//
//  ChannelViewController.swift
//  mvvmc-example
//
//  Created by Artur Carneiro on 01/01/20.
//  Copyright © 2020 Artur Carneiro. All rights reserved.
//

import UIKit

final class ChannelViewController: UIViewController, UITextFieldDelegate {

    private lazy var nameTextField: UITextField = {
        let view = UITextField(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var dateTextField: UITextField = {
        let view = UITextField(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var tagsTextField: UITextField = {
        let view = UITextField(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var submitButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var viewModel: ChannelViewModel

    init(viewModel: ChannelViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        self.hideKeyboardOnTap()
        self.navigationItem.title = "Add Channel"

        styleTextField(textField: nameTextField, placeholder: "name")
        styleTextField(textField: dateTextField, placeholder: "date")
        styleTextField(textField: tagsTextField, placeholder: "tags")

        submitButton.setTitle("Submit", for: .normal)
        submitButton.addTarget(self, action: #selector(submit), for: .touchDown)

        tagsTextField.addTarget(self, action: #selector(tagsFieldDidChange(_:)), for: .editingDidEnd)
        nameTextField.addTarget(self, action: #selector(nameFieldDidChange(_:)), for: .editingDidEnd)
        dateTextField.addTarget(self, action: #selector(dateFieldDidChange), for: .editingDidEnd)

        view.addSubview(submitButton)
        view.addSubview(nameTextField)
        view.addSubview(dateTextField)
        view.addSubview(tagsTextField)

        tagsTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tagsTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        tagsTextField.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        tagsTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true

        dateTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        dateTextField.bottomAnchor.constraint(equalTo: tagsTextField.topAnchor).isActive = true
        dateTextField.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        dateTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true

        nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameTextField.bottomAnchor.constraint(equalTo: dateTextField.topAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true

        submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        submitButton.topAnchor.constraint(equalTo: tagsTextField.bottomAnchor).isActive = true
        submitButton.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        submitButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    @objc private func submit() {
        viewModel.submit()
    }

    @objc func nameFieldDidChange(_ textField: UITextField) {
        if let text = textField.text {
            viewModel.name = text
        }
    }

    @objc func tagsFieldDidChange(_ textField: UITextField) {
        if let text = textField.text {
            viewModel.tags = text
        }
    }

    @objc func dateFieldDidChange(_ textField: UITextField) {
        if let text = textField.text {
            viewModel.date = text
        }
    }

    private func styleTextField(textField: UITextField, placeholder: String) {
        textField.attributedPlaceholder = NSAttributedString(string: placeholder)
        textField.keyboardAppearance = .default
        textField.autocorrectionType = .no
        textField.returnKeyType = .done
        textField.textAlignment = .center
        textField.delegate = self
    }

}

extension UIViewController {
    public func hideKeyboardOnTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}
