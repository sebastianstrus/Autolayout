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
    

    let pages = APIDemo.getAllPages()
    
    
    
    private let prevButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("PREV", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        btn.setTitleColor(.gray, for: .normal)
        btn.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return btn
    }()
    
    lazy var pageControll: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count// for lazy var
        pc.currentPageIndicatorTintColor = .purple
        pc.pageIndicatorTintColor = .gray
        return pc
    }()
    private let nextButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("NEXT", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        btn.setTitleColor(.purple, for: .normal)
        btn.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return btn
    }()
    
    
    
    fileprivate func setupBottomControls() {
        let bottomControlsStackView = UIStackView(arrangedSubviews: [prevButton, pageControll, nextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        view.addSubview(bottomControlsStackView)
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBottomControls()
        collectionView?.backgroundColor = .white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.isPagingEnabled = true
    }
    
    
    
    
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControll.currentPage = Int(x / view.frame.width)
    }
    
    
    //helpers
    @objc private func handlePrev() {
        Swift.print("Prev pressed")
        let prevIndex = max(pageControll.currentPage - 1, 0)
        let indexPath = IndexPath(item: prevIndex, section: 0)
        pageControll.currentPage = prevIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @objc private func handleNext() {
        Swift.print("Next pressed")
        let nextIndex = min(pageControll.currentPage + 1, pages.count - 1)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControll.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    
    
}



