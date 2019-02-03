//
//  HomeViewController.swift
//  ScrollableUIScrollView
//
//  Created by KUTAN ÇINGISIZ on 3.02.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

final class HomeViewController : UIViewController {
    
    enum HamburgerState {
        case active
        case passive
    }
    
    private let subView = HomeView()
    private var hamburgerState : HamburgerState = .passive
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        self.setupViews()
        self.setTapGestures()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: Subview
    func setupViews(){
        
        self.view.addSubview(subView)
        self.subView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, traling: view.trailingAnchor)
        
    }
    
    // MARK : Tap Gestures
    func setTapGestures(){
        self.subView.hamburgerMenuButton.addTarget(self, action: #selector(onHamburgerMenuTapped), for: .touchUpInside)
    }
    
    @objc func onHamburgerMenuTapped(){
        
        if self.hamburgerState == .passive {
            self.subView.onHamburgerMenuActive()
            self.hamburgerState = .active
        }else {
            self.subView.onHamburgerMenuPassive()
            self.hamburgerState = .passive
        }
        
    }
    
}
