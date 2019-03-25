//
//  SomeModalViewController.swift
//  LeakyApp
//
//  Created by Vincent Chau on 2/24/19.
//  Copyright © 2019 Vincent Chau. All rights reserved.
//

import UIKit

class SomeModalViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet weak var actionButton: UIButton!

    // MARK: - Handlers

    var actionHandler: (() -> Void)?

    // MARK: - Init

    init() {
        super.init(nibName: "SomeModalViewController", bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - IBActions

    @IBAction func onTappedAction(_ sender: Any) {
        actionHandler?()
    }

}
