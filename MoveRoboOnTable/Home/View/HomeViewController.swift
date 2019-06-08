//
//  HomeViewController.swift
//  MoveRoboOnTable
//
//  Created by Priyanka on 09/06/19.
//  Copyright © 2019 Priyanka. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    @IBOutlet weak var directionPicker: UIPickerView!
    @IBOutlet weak var xPicker: UIPickerView!
    @IBOutlet weak var yPicker: UIPickerView!
    private let pickerData = [0, 1, 2, 3, 4]
    private let directionData = DirectionOutput.allCases
    private var section = 4
    private var row = 0
    private var direction: DirectionOutput = .east
    private let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Place the robot"
    }
    
    @IBAction func placeDefault(_ sender: UIButton) {
        pushGridVC(section: 4, row: 0, direction: .east)
    }
    
    @IBAction func placeBot(_ sender: UIButton) {
        viewModel.mapDirectionToAngle(direction: direction)
        pushGridVC(section: section, row: row, direction: direction)
    }
    
    private func pushGridVC(section: Int, row: Int, direction: DirectionOutput){
        let gridVC: GridViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GridViewController") as! GridViewController
        gridVC.currentPositionSection = section
        gridVC.currentPositionRow = row
        self.navigationController?.pushViewController(gridVC, animated: true)
    }
    
    //Mark: Picker delegates
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == directionPicker{
            return 4
        }
        return 5
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == directionPicker{
            return directionData[row].rawValue
        }
        return "\(pickerData[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == yPicker{
            section = 4 - row
        }else if pickerView == xPicker{
            self.row = row
        }else{
            direction = directionData[row]
        }
    }
}
