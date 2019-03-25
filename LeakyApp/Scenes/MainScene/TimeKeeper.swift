//
//  TimeKeeper.swift
//  LeakyApp
//
//  Created by Vincent Chau on 3/25/19.
//  Copyright © 2019 Vincent Chau. All rights reserved.
//

import UIKit

protocol TimeKeeperDelegate {
    func timeKeeper(_ timeKeeper: TimeKeeper, didUpdateWithTime time: TimeInterval)
}

class TimeKeeper: NSObject {

    private var timer: Timer?
    private var currentTime: TimeInterval = 0.0
    private let timeInterval: TimeInterval = 1.0

    // There is a retain cycle here by keeping a strong reference to the delegate, and the delegate `TimerViewController` has a strong reference to the timer, causing a retain cycle.
    // Even though this protocol is not decalared with a class constraint there is still a strong reference to the delegate.
    // To Fix: We need to update the protocol to a class constrained protocl and declare this variable as weak.
    var delegate: TimeKeeperDelegate?

    func start() {
        timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(scheduledTask), userInfo: nil, repeats: true)
        timer?.fire()
    }

    func stop() {
        timer?.invalidate()
        timer = nil
    }

    @objc func scheduledTask() {
        currentTime += timeInterval
        delegate?.timeKeeper(self, didUpdateWithTime: currentTime)
    }

}

