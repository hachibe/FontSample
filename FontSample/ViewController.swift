//
//  ViewController.swift
//  FontSample
//
//  Created by Hachibe on 2017/11/18.
//  Copyright © 2017年 Masanori. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var title1: UILabel!
    @IBOutlet weak var title2: UILabel!
    @IBOutlet weak var title3: UILabel!
    @IBOutlet weak var headline: UILabel!
    @IBOutlet weak var subheadline: UILabel!
    @IBOutlet weak var body: UILabel!
    @IBOutlet weak var callout: UILabel!
    @IBOutlet weak var footnote: UILabel!
    @IBOutlet weak var caption1: UILabel!
    @IBOutlet weak var caption2: UILabel!
    
    @IBOutlet var labels: [UILabel]!
    var texts = [UILabel: String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for label in labels {
            texts[label] = label.text
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
            label.text = texts[label]! + ": \(label.font.pointSize)"
        }
    }
}
