//
//  ViewModel.swift
//  MoveRoboOnTable
//
//  Created by Priyanka on 08/06/19.
//  Copyright © 2019 Priyanka. All rights reserved.
//

import UIKit
var currentAngle: CGFloat = 0

final class ViewModel{
    var mapAngleToDirection: DirectionOutput = .east
    var minPosition = 0
    var maxPosition = 4
    
    func getDirection() -> String{
        switch currentAngle {
        case AngleToDirection.east.rawValue:
            mapAngleToDirection = .east
        case AngleToDirection.west.rawValue:
            mapAngleToDirection = .west
        case AngleToDirection.north.rawValue:
            mapAngleToDirection = .north
        case AngleToDirection.south.rawValue:
            mapAngleToDirection = .south
        default:
            print("")
        }
        return mapAngleToDirection.rawValue
    }
    
    func move(row: Int, column: Int) -> (Int, Int, Bool){
        let (movedRow,movedColumn) = getPosition(row: row, column: column)
        if checkValidity(row: movedRow, column: movedColumn){
            return (movedRow, movedColumn, false)
        } else {
            return (row, column, true)
        }
    }
    
    private func getPosition(row: Int, column: Int) -> (Int, Int){
        let _ = getDirection()
        switch mapAngleToDirection {
        case .east:
            return (row, column + 1)
        case .west:
            return (row, column - 1)
        case .north:
            return (row - 1, column)
        case .south:
            return (row + 1, column)
        }
    }
    
    private func checkValidity(row: Int, column: Int) -> Bool{
        if row < minPosition || row > maxPosition || column < minPosition || column > maxPosition{
            return false
        }
        return true
    }
}
