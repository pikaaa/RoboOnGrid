//
//  Enums.swift
//  MoveRoboOnTable
//
//  Created by Priyanka on 09/06/19.
//  Copyright © 2019 Priyanka. All rights reserved.
//

import UIKit

enum Direction{
    case left
    case right
    case none
}

enum DirectionOutput: String, CaseIterable{
    case east = "east"
    case north = "north"
    case west = "west"
    case south = "south"
}

enum AngleToDirection: CGFloat{
    case south = 90
    case west = 180
    case north = 270
    case east = 360
}
