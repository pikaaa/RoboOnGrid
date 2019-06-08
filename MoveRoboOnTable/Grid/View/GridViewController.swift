//
//  ViewController.swift
//  MoveRoboOnTable
//
//  Created by Priyanka on 08/06/19.
//  Copyright © 2019 Priyanka. All rights reserved.
//

import UIKit

final class GridViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    //MARK:- Variables
    private let itemsPerRow: CGFloat = 5
    var currentPositionSection = 4
    var currentPositionRow = 0
    var facingDirection: Direction = .none //default is right
    private var changeDirection = false
    private var viewModel = ViewModel()
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: Helper
    func showAlert(title: String, message: String){
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertVC.addAction(action)
        self.present(alertVC, animated: true, completion: nil)
    }
    
    //MARK: IBActions
    @IBAction func faceRight(_ sender: UIButton) {
        facingDirection = .right
        changeDirection = true
        collectionView.reloadData()
    }
    
    @IBAction func faceLeft(_ sender: UIButton) {
        facingDirection = .left
        changeDirection = true
        collectionView.reloadData()
    }
    
    @IBAction func report(_ sender: UIButton) {
        showAlert(title: "Position details of robot", message: "You're facing \(viewModel.getDirection()) with position (\(4 - currentPositionSection), \(currentPositionRow))")
    }
    
    @IBAction func move(_ sender: UIButton) {
        let (section, row, wrongDirection) = viewModel.move(row: currentPositionSection, column: currentPositionRow)
        
        if wrongDirection{
            showAlert(title: "Oops!!", message: "This position is not accessible. Try changing the direction!")
        } else {
            currentPositionSection = section
            currentPositionRow = row
            collectionView.reloadData()
        }
    }
    
    //MARK: Collection view delegates
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Cell
        
        if indexPath.row == currentPositionRow && indexPath.section == currentPositionSection{
            cell.configureCell(isHidden: false, direction: changeDirection ? facingDirection : .none)
            changeDirection = false
        } else{
            cell.configureCell()
        }
        return cell
    }
    
    //MARK:- UICollectionViewDelegateFlowLayout delegates
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthPerItem = collectionView.frame.width / itemsPerRow
        let heightPerItem = collectionView.frame.height / itemsPerRow
        
        return CGSize(width: widthPerItem, height: heightPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}


