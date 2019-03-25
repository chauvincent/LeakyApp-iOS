//
//  TimerViewController.swift
//  LeakyApp
//
//  Created by Vincent Chau on 3/25/19.
//  Copyright © 2019 Vincent Chau. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    // MARK: - IBOutlet

    @IBOutlet weak var timeLabel: UILabel!

    // MARK: - Properties

    var timeKeeper: TimeKeeper?

    // MARK: - Init

    init() {
        super.init(nibName: "TimerViewController", bundle: nil)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        timeKeeper = TimeKeeper()
        timeKeeper?.delegate = self
    }

    deinit {
        timeKeeper?.stop()
    }

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        timeKeeper?.start()
    }

}

extension TimerViewController: TimeKeeperDelegate {
    func timeKeeper(_ timeKeeper: TimeKeeper, didUpdateWithTime time: TimeInterval) {
        timeLabel.text = String(time)
    }
}
