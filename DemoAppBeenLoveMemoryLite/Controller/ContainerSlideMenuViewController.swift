//
//  ContainerSlideMenuViewController.swift
//  DemoAppBeenLoveMemoryLite
//
//  Created by dohien on 28/08/2018.
//  Copyright © 2018 dohien. All rights reserved.
//

import UIKit

class ContainerSlideMenuViewController: UIViewController {

    
    @IBOutlet weak var mainViewContaner: UIView!
    @IBOutlet weak var sidemenuViewContainer: UIView!
    @IBOutlet weak var corverButton: UIButton!
    @IBOutlet weak var leftSideMenuContaints: NSLayoutConstraint!
    var isSideMenuOpen: Bool = false {
        didSet{
            if isSideMenuOpen {
                configForSideMenuOpeningState()
            }else {
                configForSideMenuClosingState()
            }
            UIView.animate(withDuration: 0.35, animations: {
                self.view.layoutIfNeeded()
            })
        }
    }
    func configForSideMenuOpeningState() {
        self.sidemenuViewContainer.clipsToBounds = false
        self.leftSideMenuContaints.constant = 0
        self.corverButton.alpha = 0.5
    }
    func configForSideMenuClosingState() {
        self.leftSideMenuContaints.constant = -sidemenuViewContainer.bounds.width
        
        self.corverButton.alpha = 0
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNotification()
        configForSideMenuClosingState()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(onClickCorverButton), name: NotificationKey.menuClick, object: nil)
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBAction func onClickCorverButton(_ sender: UIButton) {
        isSideMenuOpen = !isSideMenuOpen
    }
}
