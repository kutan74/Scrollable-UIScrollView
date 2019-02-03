//
//  HomeView.swift
//  ScrollableUIScrollView
//
//  Created by KUTAN ÇINGISIZ on 3.02.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

final class HomeView : UIView {
    
    private let scrollView : UIScrollView = {
       
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = false
        scrollView.backgroundColor = .clear
        //scrollView.contentInsetAdjustmentBehavior = .never
        return scrollView
        
    }()
    
    let hamburgerMenuButton : UIButton = {
       
        let button = UIButton()
        button.setImage(UIImage(named: "hamburger"), for: .normal)
        return button
        
    }()
    
    private let mainView = HomeMainScrollableView()
    private let childView = HomeSubScrollableView()
    
    private var contentOffsetY : CGFloat = 0.0
    private var childViewHeight : CGFloat = 200.0
    private var childViewTopPadding : CGFloat = 50.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupViews()        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder) has not been implemented")
    }
    
    func setupViews(){
        
        self.addSubview(scrollView)
        
        let screenWidth = UIScreen.main.bounds.size.width
        
        scrollView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, traling: trailingAnchor)
        scrollView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalToConstant: 2000).isActive = true
        
        // Main View
        self.scrollView.addSubview(mainView)
        
        mainView.anchor(top: scrollView.topAnchor, leading: scrollView.leadingAnchor, bottom: nil, traling: scrollView.trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16))
        mainView.widthAnchor.constraint(equalToConstant: screenWidth - 32).isActive = true
        mainView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
        
        // Hamburger
        self.scrollView.addSubview(hamburgerMenuButton)
        
        hamburgerMenuButton.anchor(top: nil, leading: mainView.leadingAnchor, bottom: mainView.bottomAnchor, traling: nil, padding: .init(top: 0, left: 32, bottom: 32, right: 0), size: .init(width: 38, height: 38))
        
        // Child View
        self.scrollView.addSubview(childView)
        childView.anchor(top: mainView.bottomAnchor, leading: scrollView.leadingAnchor, bottom: nil, traling: scrollView.trailingAnchor, padding: .init(top: childViewTopPadding, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: self.childViewHeight))
        childView.widthAnchor.constraint(equalToConstant: screenWidth - 32).isActive = true
        
        
        // Calculating how much we will offset in y axis
        self.contentOffsetY = self.childViewHeight + self.childViewTopPadding + 50
    }
    
    
    func onHamburgerMenuActive(){
        self.scrollView.setContentOffset(.init(x: 0, y: self.contentOffsetY
            ), animated: true)
    }
    
    func onHamburgerMenuPassive(){
        self.scrollView.setContentOffset(.init(x: 0, y: 0
            ), animated: true)
    }
}
