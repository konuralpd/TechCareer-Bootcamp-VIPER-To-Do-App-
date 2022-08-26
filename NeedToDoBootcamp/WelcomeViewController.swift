//
//  ViewController.swift
//  NeedToDoBootcamp
//
//  Created by Mac on 26.08.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func nextButtonClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "toHomeVC", sender: nil)
    }
    
}

