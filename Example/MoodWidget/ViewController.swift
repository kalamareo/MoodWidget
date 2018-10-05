//
//  ViewController.swift
//  MoodWidget
//
//  Created by Manuel Bermudez on 10/05/2018.
//  Copyright (c) 2018 Manuel Bermudez. All rights reserved.
//

import UIKit
import MoodWidget

class ViewController: UIViewController, MoodWidgetProtocol {
    
    var moodWidget: MoodWidgetView = MoodWidgetView()

    override func viewDidLoad() {
        super.viewDidLoad()
        moodWidget.initialize(parent: self)
        moodWidget.show()

    }

    func selectedMoodAction(value: Int) {
        print(value)
    }
}

