//
//  ViewController.swift
//  Apple Watch Bubble Interface
//
//  Created by Nicholas Naudé on 27/04/2016.
//  Copyright © 2016 Nicholas Naudé. All rights reserved.
//  TUTORIAL: https://www.invasivecode.com/weblog/apple-watch-home-screen-ui-animation/

import UIKit

let cellCount = ROWS * COLS

class ViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.collectionViewLayout = CollectionViewLayout()
        self.collectionView.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
    }//
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellCount
    }//
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MyCell", forIndexPath: indexPath) as! CollectionViewCell
        return cell
    }//
}

