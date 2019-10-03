//
//  SplashViewController.swift
//  CursoiOSAdvance
//
//  Created by Dev2 on 02/10/2019.
//  Copyright © 2019 Raul Martin. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let storyBorard = UIStoryboard(name: "Main", bundle: nil)
            guard let viewControllerDestination = storyBorard.instantiateInitialViewController() else {
                return
            }
            
            self.present(viewControllerDestination, animated: true)
        }
    }


}

