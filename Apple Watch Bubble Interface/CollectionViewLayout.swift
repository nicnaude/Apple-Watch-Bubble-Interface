//
//  CollectionViewLayout.swift
//  Apple Watch Bubble Interface
//
//  Created by Nicholas Naudé on 27/04/2016.
//  Copyright © 2016 Nicholas Naudé. All rights reserved.
//

import UIKit

let COLS = 20
let ROWS = 20

class CollectionViewLayout: UICollectionViewLayout {
    
    //1. space between the cells:
    let interimSpace: CGFloat = 0.0
    
    //2. Each cell has a diameter of 80 points
    let itemSize: CGFloat = 80
    
    //3. A computed property representing the center of the animation:
    var center: CGPoint {
        return CGPoint(x: (self.cViewSize.width) / 2.0, y: (self.cViewSize.height) / 2.0)
    }
    
    //4. A computed property that holds the total number of cells:
    var cellCount: Int {
        return COLS*ROWS
    }
    
    //5. A computed property holding the size of the collection view:
    var cViewSize: CGSize {
        return self.collectionView!.frame.size
    }
    
    //6. A computed property holding the value of the paraboloid parameter a:
    var a: CGFloat {
        return 2.5 * self.cViewSize.width
    }
    
    //7. A computed property holding the value of the paraboloid parameter b:
    var b: CGFloat {
        return 2.5 * self.cViewSize.height
    }
    
    // 8. A stored property holding the value of the paraboloid parameter c:
    let c: CGFloat = 20
    
    //Since I want to change the layout of the collection view every time the user scrolls it, I need to invalidate the collection view layout at every bounds change. To do so, I add the following method to the CollectionViewLayout class:
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }
    
    //The collection view content size is obtained by the size of each cell plus the space between two consecutive adjacent cells multiplied by the number of cells in the horizontal and vertical direction:
    override func collectionViewContentSize() -> CGSize {
        return CGSizeMake(self.itemSize * CGFloat(COLS) + self.cViewSize.width, self.itemSize * CGFloat(ROWS) + self.cViewSize.height)
    }
    
    // The layout attributes for each element in the rect of the collection view:
    func layoutAttributesForElementsInRectangle(rect: CGRect) -> [AnyObject]? {
        var attributes = [AnyObject]()
        for i in 0 ..< cellCount {
            let indexPath = NSIndexPath(forItem: i, inSection: 0)
            attributes.append(self.layoutAttributesForItemAtIndexPath(indexPath)!)
        }
        return attributes
    }//
    
    
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes?
    {
        let attributes = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
        
        let oIndex = indexPath.item % COLS // 1
        let vIndex = (indexPath.item - oIndex) / COLS // 2
        
        var x = CGFloat(oIndex) * self.itemSize // 3
        var y = CGFloat(vIndex) * self.itemSize // 4
        
        if vIndex % 2 != 0 { // 5
            x += self.itemSize / 2.0
        }
        
        attributes.center = CGPoint(x: x, y: y) // 6
        
        let offset = self.collectionView!.contentOffset // 7
        x -= (self.center.x + CGFloat(offset.x)) // 8
        y -= (self.center.y + CGFloat(offset.y)) // 9
        
        x = -x*x/(a*a) // 10
        y = -y*y/(b*b) // 11
        var z = c * (x+y) + 1.0 // 12
        z = z < 0.0 ? 0.0 : z // 13
        
        attributes.transform = CGAffineTransformMakeScale(z, z) // 14
        attributes.size = CGSize(width: self.itemSize, height: self.itemSize) // 15
        
        return attributes
    }
    
}///