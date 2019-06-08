//
//  Cell.swift
//  MoveRoboOnTable
//
//  Created by Priyanka on 08/06/19.
//  Copyright © 2019 Priyanka. All rights reserved.
//

import UIKit

final class Cell: UICollectionViewCell{
    
    @IBOutlet weak var robotView: UIView!
    
    @IBOutlet weak var directionImageView: UIImageView!
    
    func configureCell(isHidden: Bool = true, direction: Direction = .none){
        robotView.isHidden = isHidden
        directionImageView.isHidden = isHidden
       
        switch direction {
        case .left:
            currentAngle = currentAngle + 270
            rotateImage()
        case .right:
            currentAngle = currentAngle + 90
            rotateImage()
        default:
            rotateImage()
        }
    }
    
    private func rotateImage(){
        if currentAngle > 360{
            currentAngle = currentAngle - 360
        }
        
        let radians: CGFloat = currentAngle * (.pi / 180)
        directionImageView.transform = CGAffineTransform(rotationAngle: radians)
    }
}

