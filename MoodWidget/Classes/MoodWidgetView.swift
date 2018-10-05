//
//  MoodWidgetView.swift
//  Coco
//
//  Created by Manuel Bermudez Rodriguez on 2/10/18.
//  Copyright © 2018 Navandu. All rights reserved.
//

import UIKit

public class MoodWidgetView: UIView {

    var controller: MoodWidgetVC!
    var parent: UIViewController!
    
    public func initialize(parent:UIViewController){
        
        if controller != nil {
            return
        }
        self.parent = parent
        self.frame = CGRect(x: 0, y: parent.view.frame.size.height, width: parent.view.frame.size.width, height: 78)
        parent.view.addSubview(self)
        
        let podBundle = Bundle(for: MoodWidgetVC.self)
        
        let bundleURL = podBundle.resourceURL?.appendingPathComponent("MoodWidget.bundle")
        let resourceBundle = Bundle(url: bundleURL!)

        
        let storyboard = UIStoryboard(name: "MoodWidget", bundle: resourceBundle)
        self.controller = storyboard.instantiateViewController(withIdentifier: "MoodWidgetVC") as? MoodWidgetVC
        
        if let controller = self.controller {
            controller.willMove(toParent: parent)
            controller.view.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
            controller.initialize(container: self, delegate: parent as! MoodWidgetProtocol)
            self.addSubview(controller.view)
            parent.addChild(controller)
            controller.didMove(toParent: parent)
            
        }
    }

    public func show(){
        UIView.animate(withDuration: 0.4) {
            self.frame = CGRect(x: 0, y: self.parent.view.frame.size.height - 78, width: self.parent.view.frame.size.width, height: 78)
        }
    }
    
    public func hide(){
        UIView.animate(withDuration: 0.4) {
            self.frame = CGRect(x: 0, y: self.parent.view.frame.size.height, width: self.parent.view.frame.size.width, height: 78)
        }
    }
}
