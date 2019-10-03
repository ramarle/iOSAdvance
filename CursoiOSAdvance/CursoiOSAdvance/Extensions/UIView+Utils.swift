//
//  UIView.swift
//  CursoiOSAdvance
//
//  Created by Dev2 on 03/10/2019.
//  Copyright © 2019 Raul Martin. All rights reserved.
//

//
//  UIView+Utils.swift
//  CursoiOS
//
//  Created by David Jardon on 27/09/2019.
//  Copyright © 2019 ds. All rights reserved.
//

import UIKit

extension UIView {
    func configureShadows(color: UIColor = UIColor.lightGray,
                          opacity: Float = 0.6,
                          radius: CGFloat = 4.0,
                          offset: CGSize = CGSize.zero) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
    }
}
