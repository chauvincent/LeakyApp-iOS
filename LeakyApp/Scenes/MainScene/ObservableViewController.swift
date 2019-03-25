//
//  ObservableViewController.swift
//  LeakyApp
//
//  Created by Vincent Chau on 3/24/19.
//  Copyright © 2019 Vincent Chau. All rights reserved.
//

import UIKit

// MARK: - Notifications

extension Notification.Name {
    static let SomethingToObserveNotification = Notification.Name(rawValue: "SomethingToObserverNotification")
}

// MARK: - ObservableViewController

class ObservableViewController: UIViewController {

    // MARK: - Init

    init() {
        super.init(nibName: "ObservableViewController", bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addObservers()
    }

    // MARK: - Add Observers

    private func addObservers() {
        // There is a memory leak here because passing in a function as a closure holds a strong reference to `self` by default!!
        // This will cause the __NSObserver object to hold a strong reference to the closure and as a result hold a strong reference to this controller. `deinit` will never be called and we will leak an instance of this controller everytime this view controller is loaded.
        NotificationCenter.default.addObserver(forName: .SomethingToObserveNotification, object: nil, queue: .main, using: handleNotification)
        // To Fix: add [weak self] or [unowned self] in the capture list. Do not pass in the function as a closure.
        /*
        NotificationCenter.default.addObserver(forName: .SomethingToObserveNotification, object: nil, queue: .main) { [weak self] notification in
                self?.handleNotification(notification)
            }
        */
    }

    private func handleNotification(_ notification: Notification) {
        // No-op but there is a leak in this controller!
    }

}
