//
//  JoyeCollectionViewCell.swift
//  SnapingCollectionCarousel
//
//  Created by Abdalmagid elmaghbub on 5/13/20.
//  Copyright © 2020 Abdalmagid elmaghbub. All rights reserved.
//

import UIKit

class JoyeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var backgroundCardView: UIView!
    
    @IBOutlet weak var number: UILabel!
    func setUpCard(){
        
        
        
       backgroundCardView.backgroundColor = UIColor.white

        backgroundCardView.layer.cornerRadius = 0.0
        backgroundCardView.layer.masksToBounds = false
        
        backgroundCardView.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        backgroundCardView.layer.shadowOffset = CGSize(width: 0, height: 0)
        backgroundCardView.layer.shadowOpacity = 0.8
    }
}
