//
//  MoodWidgetVC.swift
//  Coco
//
//  Created by Manuel Bermudez Rodriguez on 10/9/18.
//  Copyright © 2018 Navandu. All rights reserved.
//

import UIKit

public protocol MoodWidgetProtocol {
    func selectedMoodAction(value:Int)
}

class MoodWidgetVC: UIViewController {

    var delegate: MoodWidgetProtocol?
    private var container: MoodWidgetView!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func initialize(container:MoodWidgetView, delegate: MoodWidgetProtocol){
        self.delegate = delegate
        self.container = container
    }
    
    @IBAction func choiceAction(_ sender: UIButton) {
        delegate?.selectedMoodAction(value: sender.tag)
        container.hide()
    }
   
    

}
