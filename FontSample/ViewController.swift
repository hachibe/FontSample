//
//  ViewController.swift
//  FontSample
//
//  Created by Hachibe on 2017/11/18.
//  Copyright © 2017年 Masanori. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet var labels: [UILabel]!
    var defaultStrings = [UILabel: String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for label in labels {
            defaultStrings[label] = label.text
        }
        update()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if previousTraitCollection?.preferredContentSizeCategory != traitCollection.preferredContentSizeCategory {
            DispatchQueue.main.async {
                self.update()
            }
        }
    }
    
    private func update() {
        for label in labels {
            if let inputText = textField.text, !inputText.isEmpty {
                label.text = inputText + ": \(label.font.pointSize)"
            } else {
                label.text = defaultStrings[label]! + ": \(label.font.pointSize)"
            }
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textField.text = ""
        update()
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        update()
        textField.resignFirstResponder()
        return true
    }
}
