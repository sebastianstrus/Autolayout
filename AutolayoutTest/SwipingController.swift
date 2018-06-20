//
//  SwipingController.swift
//  AutolayoutTest
//
//  Created by Sebastian Strus on 2018-06-20.
//  Copyright © 2018 Sebastian Strus. All rights reserved.
//

import UIKit

//controller
class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "celId"
    

    let pages = [
        Page(imageName: "Diamond is a vary solid form!1", title: "First", description: "description1"),
        Page(imageName: "Diamond is a vary solid form!2", title: "Second", description: "description2"),
        Page(imageName: "Diamond is a vary solid form!3", title: "Third", description: "description3"),
        Page(imageName: "Diamond is a vary solid form!4", title: "Fourth", description: "description4")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.isPagingEnabled = true
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PageCell
        //cell.topImageView.image = UIImage(named: pages[indexPath.item].imageName)
        //cell.descriptionTextView.text = pages[indexPath.item].title
        cell.page = pages[indexPath.item]
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //return CGSize(width: 100, height: 100)
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.5
    }
    
}
