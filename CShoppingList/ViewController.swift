//
//  ViewController.swift
//  CShoppingList
//
//  Created by Antonio Toriz on 10/1/21.
//

import UIKit

class ViewController: UIViewController {
    
    let imageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "order-completed-5.png"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let shoppingLabel: UILabel = {
        let label = UILabel()
        label.textColor = .fontColor
        label.font = UIFont(name: "Inter-Regular", size: 24)
        label.font = label.font.withSize(24)
        label.textAlignment = .center
        label.text = "my shopping list"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let inputsView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondaryBackgroundColor
        view.layer.cornerRadius = 4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let itemInput: UITextField = {
        let input = UITextField()
        input.backgroundColor = .white
        input.textColor = .fontColor
        input.layer.cornerRadius = 4
        input.placeholder = "Item"
        input.borderStyle = .roundedRect
        input.translatesAutoresizingMaskIntoConstraints = false
        return input
    }()
    
    let quantityInput: UITextField = {
        let input = UITextField()
        input.backgroundColor = .white
        input.textColor = .fontColor
        input.layer.cornerRadius = 4
        input.placeholder = "Quantity"
        input.borderStyle = .roundedRect
        input.translatesAutoresizingMaskIntoConstraints = false
        return input
    }()
    
    let addItemButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .accentColor
        button.layer.cornerRadius = 4
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(addItem(_:)), for: .touchUpInside)
        return button
    }()
    
    let itemsView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondaryBackgroundColor
        view.layer.cornerRadius = 4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let itemsList: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.font = UIFont(name: "Inter-Regular", size: 12)
        textView.font = textView.font?.withSize(12)
        textView.textContainer.lineBreakMode = .byWordWrapping
        textView.textColor = .placeholderText
        textView.text = "Add a grocery item..."
        textView.isEditable = true
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.itemInput.delegate = self
        self.quantityInput.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil);

        view.backgroundColor = .backgroundColor

        view.addSubview(imageView)
        view.addSubview(shoppingLabel)
        view.addSubview(inputsView)
        view.addSubview(itemsView)
        inputsView.addSubview(itemInput)
        inputsView.addSubview(quantityInput)
        inputsView.addSubview(addItemButton)
        itemsView.addSubview(itemsList)

        setConstraints()
    }
    
}

// MARK: - Functions
extension ViewController {
    @objc func addItem(_ sender: UIButton!) {
        if itemsList.text == "Add a grocery item..." {
            itemsList.textColor = .fontColor
            itemsList.text = "- \(itemInput.text!) (\(quantityInput.text!))"
        } else {
            itemsList.text.append("\n- \(itemInput.text!) (\(quantityInput.text!))")
        }
        itemInput.text = ""
        quantityInput.text = ""
        self.view.endEditing(true)
    }
    
    @objc func keyboardWillShow(sender: NSNotification) {
         self.view.frame.origin.y = -150
    }

    @objc func keyboardWillHide(sender: NSNotification) {
         self.view.frame.origin.y = 0
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            // image constraints
            imageView.widthAnchor.constraint(equalToConstant: 287),
            imageView.heightAnchor.constraint(equalToConstant: 191),
            imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 44),
            imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -44),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 47),
            
            // 'my shopping list' label constraints
            shoppingLabel.widthAnchor.constraint(equalToConstant: 268),
            shoppingLabel.heightAnchor.constraint(equalToConstant: 48),
            shoppingLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 54),
            shoppingLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 0),
            
            // inputs view background constraints
            inputsView.widthAnchor.constraint(equalToConstant: 343),
            inputsView.heightAnchor.constraint(equalToConstant: 124),
            inputsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            inputsView.topAnchor.constraint(equalTo: shoppingLabel.bottomAnchor, constant: 38),
            inputsView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            // item input constraints
            itemInput.widthAnchor.constraint(equalToConstant: 311),
            itemInput.heightAnchor.constraint(equalToConstant: 44),
            itemInput.leadingAnchor.constraint(equalTo: inputsView.leadingAnchor, constant: 16),
            itemInput.topAnchor.constraint(equalTo: inputsView.topAnchor, constant: 12),
            itemInput.trailingAnchor.constraint(equalTo: inputsView.trailingAnchor, constant: -16),
            
            // quantity input constraints
            quantityInput.widthAnchor.constraint(equalToConstant: 255),
            quantityInput.heightAnchor.constraint(equalToConstant: 44),
            quantityInput.leadingAnchor.constraint(equalTo: inputsView.leadingAnchor, constant: 16),
            quantityInput.topAnchor.constraint(equalTo: itemInput.bottomAnchor, constant: 12),
            
            // add button constraints
            addItemButton.widthAnchor.constraint(equalToConstant: 44),
            addItemButton.heightAnchor.constraint(equalToConstant: 44),
            addItemButton.leadingAnchor.constraint(equalTo: quantityInput.trailingAnchor, constant: 12),
            addItemButton.topAnchor.constraint(equalTo: itemInput.bottomAnchor, constant: 12),
            addItemButton.trailingAnchor.constraint(equalTo: inputsView.trailingAnchor, constant: -16),
            
            // items view constraints
            itemsView.widthAnchor.constraint(equalToConstant: 343),
            itemsView.heightAnchor.constraint(equalToConstant: 322),
            itemsView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            itemsView.topAnchor.constraint(equalTo: inputsView.bottomAnchor, constant: 18),
            itemsView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            itemsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -12),
            
            // item list constraints
            itemsList.widthAnchor.constraint(equalToConstant: 311),
            itemsList.leadingAnchor.constraint(equalTo: itemsView.leadingAnchor, constant: 16),
            itemsList.topAnchor.constraint(equalTo: itemsView.topAnchor, constant: 12),
            itemsList.trailingAnchor.constraint(equalTo: itemsView.trailingAnchor, constant: -16),
            itemsList.bottomAnchor.constraint(equalTo: itemsView.bottomAnchor, constant: -12)
        ])
    }
}

// MARK: - UITextFieldDelegate

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}
