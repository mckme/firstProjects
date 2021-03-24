//
//  ViewController.swift
//  Pictionary
//
//  Created by Piyush Bhatt on 26/02/21.
//  Copyright © 2021 none. All rights reserved.
//


import UIKit

class StartPage: UIViewController {
    
    @IBOutlet var StartButton: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        StartButton.pulsate()
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
   @IBAction func proceedToMain(_ sender: Any) {
        let vc = PictionaryMain.controller()
        navigationController?.pushViewController(vc, animated: true)
    
   }
}

