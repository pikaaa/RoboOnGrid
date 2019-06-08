//
//  HomeViewModel.swift
//  MoveRoboOnTable
//
//  Created by Priyanka on 09/06/19.
//  Copyright © 2019 Priyanka. All rights reserved.
//

import UIKit

final class HomeViewModel{
    
    func mapDirectionToAngle(direction: DirectionOutput){
        switch direction {
        case .west:
            currentAngle = AngleToDirection.west.rawValue
        case .east:
            currentAngle = AngleToDirection.east.rawValue
        case .north:
            currentAngle = AngleToDirection.north.rawValue
        case .south:
            currentAngle = AngleToDirection.south.rawValue
        }
    }
}
