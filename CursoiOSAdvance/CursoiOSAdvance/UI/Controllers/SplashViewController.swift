//
//  SplashViewController.swift
//  CursoiOSAdvance
//
//  Created by Dev2 on 02/10/2019.
//  Copyright © 2019 Raul Martin. All rights reserved.
//

import UIKit
import Lottie

class SplashViewController: UIViewController {
    
    @IBOutlet weak var mView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        
        playAnimation()
        navigate()
        
    }
    
    //Función para colocar la animación
    func playAnimation(){
        let starAnimationView = AnimationView(name: "animation1")
        
        starAnimationView.contentMode = .scaleAspectFit
        starAnimationView.loopMode = .loop
        starAnimationView.frame = mView.bounds
        mView.addSubview(starAnimationView)
        
        starAnimationView.play()
    }
    
    //Función para navegar después de 3s
    private func navigate(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let storyBorard = UIStoryboard(name: "Main", bundle: nil)
            guard let viewControllerDestination = storyBorard.instantiateInitialViewController() else {
                return
            }
            
            self.present(viewControllerDestination, animated: true)
        }
    }


}

