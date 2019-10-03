//
//  PersonCollectionViewCell.swift
//  CursoiOSAdvance
//
//  Created by Dev2 on 03/10/2019.
//  Copyright © 2019 Raul Martin. All rights reserved.
//

import UIKit

class PersonCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = String(describing: PersonCollectionViewCell.self)
    
    // MARK: - Outlets -
    @IBOutlet weak var mView: UIView!
    @IBOutlet weak var mViewFooter: UIView!
    @IBOutlet weak var mImage: UIImageView!
    @IBOutlet weak var mLabelName: UILabel!
    
    
    // MARK: - Lifecycle -
    override func prepareForReuse() {
        mImage.image = nil
        mLabelName.text = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mView.layer.cornerRadius = 8.0
        mView.configureShadows()
        
        mViewFooter.layer.cornerRadius = 8.0
        mViewFooter.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    
    
    // MARK: - Configure methods -
    func configureCell(image: String? = nil, title: String? = nil) {
        mImage.image = UIImage(named: image ?? "")
        mLabelName.text = title
    }
}
