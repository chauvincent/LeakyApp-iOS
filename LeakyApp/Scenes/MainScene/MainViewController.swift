//
//  MainViewController.swift
//  LeakyApp
//
//  Created by Vincent Chau on 2/24/19.
//  Copyright © 2019 Vincent Chau. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - Init

    init() {
        super.init(nibName: "MainViewController", bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - IBActions

    @IBAction func displayLeakyModal(_ sender: Any) {
        let someModalVC = SomeModalViewController()
        someModalVC.actionHandler = {
            // There is a retain cycle here because closures keep a strong reference to `someModalVC` unless specified weak in the capture list. Since there is also a strong reference from the someModalVC to this closure, we end up with a retain cycle between the closure and someModalVC.
            // To Fix: need to add [weak someModalVC] in the capture list of this closure.
            someModalVC.dismiss(animated: true, completion: nil)
        }
        present(someModalVC, animated: true, completion: nil)
    }

    @IBAction func displayLeakyController(_ sender: Any) {
        let someLeakyVC = ObservableViewController()
        navigationController?.pushViewController(someLeakyVC, animated: true)
    }

    @IBAction func displayLeakyTimerController(_ sender: Any) {
        let leakyTimerVC = TimerViewController()
        navigationController?.pushViewController(leakyTimerVC, animated: true)
    }
}

