//
//  PageCell.swift
//  AutolayoutTest
//
//  Created by Sebastian Strus on 2018-06-20.
//  Copyright © 2018 Sebastian Strus. All rights reserved.
//

import UIKit
//view
class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet {
            guard let aPage = page else { return }
            topImageView.image = UIImage(named: (aPage.imageName))
            
            let attributedText = NSMutableAttributedString(string: aPage.title, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
            attributedText.append(NSAttributedString(string: "\n\n\n \(aPage.description)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.darkGray]))
            
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
        }
    }
    
    private let topImageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "silver"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private let descriptionTextView: UITextView = {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        let attributedText = NSMutableAttributedString(string: "Diamond is a vary solid form!", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        attributedText.append(NSAttributedString(string: "\n\n\nDiamond exists as a giant molecular structure. In diamond, there is an rigid, extensive network of carbon atoms in which each carbon atom is bonded to 4 other carbon atoms by very strong covalent bonds in a tetrahedral arrangement.", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.darkGray]))
        tv.attributedText = attributedText
        tv.textAlignment = .center
        tv.isEditable = false
        tv.isScrollEnabled = false
        return tv
    }()
    

    

    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //backgroundColor = .purple
        addSubview(descriptionTextView)
        setupLayout()
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupLayout() {
        
        // create container for topImageView
        let topImageContainerView = UIView()
        addSubview(topImageContainerView)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        //        topImageContainerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        //        topImageContainerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true//better than leftAn
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true// better than rightAn
        
        
        
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        topImageContainerView.addSubview(topImageView)
        
        topImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        topImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        //topImageView.topAnchor.constraint(equalTo: topImageContainerView.topAnchor, constant: 80).isActive = true
        //topImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        //topImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        topImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 25).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -25).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
}
