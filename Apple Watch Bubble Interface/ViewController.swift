//
//  ViewController.swift
//  Apple Watch Bubble Interface
//
//  Created by Nicholas Naudé on 27/04/2016.
//  Copyright © 2016 Nicholas Naudé. All rights reserved.
//  TUTORIAL: https://www.invasivecode.com/weblog/apple-watch-home-screen-ui-animation/

import UIKit

var myArray = []

class ViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myArray = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15, 16, 17, 18, 19, 20]
        
        self.collectionView.collectionViewLayout = CollectionViewLayout()
        self.collectionView.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
    }//
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        let cellCount = ROWS * COLS
        return myArray.count
    }//
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MyCell", forIndexPath: indexPath) as! CollectionViewCell
        let currentCell = myArray[indexPath.row]
        
        cell.cellText.text = currentCell as? String
        cell.backgroundColor = UIColor.whiteColor()
        
        return cell
    }//
}

