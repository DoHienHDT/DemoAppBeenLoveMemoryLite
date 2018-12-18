//
//  ViewController.swift
//  PopoverViewController
//
//  Created by vMio on 12/18/18.
//  Copyright © 2018 vMio. All rights reserved.
//

import UIKit

class ViewControllerPopover: UIViewController, UIPopoverPresentationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination
        let pc = vc.popoverPresentationController
        pc?.delegate = self
    }

    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }

}

