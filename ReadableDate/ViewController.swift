//
//  ViewController.swift
//  ReadableDate
//
//  Created by Alex Nagy on 12/04/2018.
//  Copyright © 2018 Alex Nagy. All rights reserved.
//

import UIKit
import LBTAComponents

class ViewController: UIViewController {
  
  let timeLabel: UILabel = {
    let label = UILabel()
    label.text = "Tap the button below to get the app launch time"
    return label
  }()
  
  let button: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Get the app launch time", for: .normal)
    button.addTarget(self, action: #selector(handleButtonTapped), for: .touchUpInside)
    return button
  }()
  
  @objc func handleButtonTapped() {
    guard let appLaunchTime = appLaunchTime else { return }
    timeLabel.text = "App Launched: \(appLaunchTime.readbaleDate())"
  }

  var appLaunchTime: Date?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    view.backgroundColor = .white
    
    setupViews()
    
    appLaunchTime = Date()
  }
  
  fileprivate func setupViews() {
    view.addSubview(timeLabel)
    view.addSubview(button)
    
    timeLabel.anchorCenterSuperview()
    button.anchor(timeLabel.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 16, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    button.anchorCenterXToSuperview()
  }
  
}

extension Date {
  func readbaleDate() -> String {
    let secondsAgo = Int(Date().timeIntervalSince(self))
    
    let minute = 60
    let hour = 60 * minute
    let day = 24 * hour
    let week = 7 * day
    let month = 4 * week
    let year = 12 * month
    
    let value: Int
    let unit: String
    if secondsAgo < minute {
      value = secondsAgo
      unit = "sec"
    } else if secondsAgo < hour {
      value = secondsAgo / minute
      unit = "min"
    } else if secondsAgo < day {
      value = secondsAgo / hour
      unit = "hour"
    } else if secondsAgo < week {
      value = secondsAgo / day
      unit = "day"
    } else if secondsAgo < month {
      value = secondsAgo / week
      unit = "week"
    } else if secondsAgo < year {
      value = secondsAgo / month
      unit = "month"
    } else {
      value = secondsAgo / year
      unit = "year"
    }
    
    return "\(value) \(unit)\(value == 1 ? "" : "s") ago"
  }
}























