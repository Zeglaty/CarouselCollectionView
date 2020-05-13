//
//  ViewController.swift
//  SnapingCollectionCarousel
//
//  Created by Abdalmagid elmaghbub on 5/13/20.
//  Copyright © 2020 Abdalmagid elmaghbub. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageDotsIndecater: UIPageControl!
    
    var cellScale : CGFloat = 0.9
    
// added for fun
    
    @IBOutlet weak var photoSteper: UIStepper!
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)

        
//        cellScale = (collectionView.frame.height / view.frame.height)// * cellScale
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenSize = UIScreen.main.bounds.size
        let cellWidth = floor(screenSize.width * 0.8)
        let cellHeight = floor(screenSize.height * cellScale)
        let insetX = (view.bounds.width - cellWidth) / 2.0
        let insetY = (view.bounds.height - cellHeight) / 2.0

        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        collectionView.contentInset = UIEdgeInsets(top: CGFloat(insetY), left: CGFloat(insetX), bottom: CGFloat(insetY), right: CGFloat(insetX))
        

         
        
    }
    
    
    @IBAction func photoSteper(_ sender: UIStepper) {
        
        pageDotsIndecater.numberOfPages = Int(sender.value)
        
        collectionView.reloadData()
    }
    
    
    


}






extension ViewController : UICollectionViewDelegate , UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if photoSteper.value != nil{
            pageDotsIndecater.numberOfPages = Int(photoSteper.value)
            return Int(photoSteper.value)
        }else{
            pageDotsIndecater.numberOfPages = 6
            return 6
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "JoyeCollectionViewCell", for: indexPath) as! JoyeCollectionViewCell
        
        cell.setUpCard()
        cell.number.text = "\(indexPath.row + 1)"
        
        return cell
    }
    
    
}

extension ViewController : UIScrollViewDelegate{
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
        let roundedIndex = round(index)
        
        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: scrollView.contentInset.top)
        
        targetContentOffset.pointee = offset
        pageDotsIndecater.currentPage = Int(roundedIndex)
    }
}

extension ViewController : UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {



        return CGSize(width:collectionView.frame.width * 0.8, height: collectionView.frame.height * cellScale)

    }
}
