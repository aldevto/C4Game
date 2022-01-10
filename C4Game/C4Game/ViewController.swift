//
//  ViewController.swift
//  C4Game
//
//  Created by Alberto Martinez on 10/1/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var turnImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        resetBoard()
        setCellWidthHeight()
        
        
    }
    
    func setCellWidthHeight() {
        
            let width = collectionView.frame.size.width / 9
            let height = collectionView.frame.size.height / 6
            let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
            flowLayout.itemSize = CGSize(width: width, height: height)
        }
}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in cv: UICollectionView) -> Int {
        return board.count
    }
    
    func collectionView(_ cv: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return board[section].count
    }

    func collectionView(_ cv: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cv.dequeueReusableCell(withReuseIdentifier: "idCell", for: indexPath) as! BoardCell
        
        let boardItem = getBoardItem(indexPath)
        cell.image.tintColor = boardItem.tileColor()
        return cell
    }

}

extension ViewController: UICollectionViewDelegate {
    
}

