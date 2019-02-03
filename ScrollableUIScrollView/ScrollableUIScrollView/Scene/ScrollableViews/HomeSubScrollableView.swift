//
//  HomeSubScrollableView.swift
//  ScrollableUIScrollView
//
//  Created by KUTAN ÇINGISIZ on 3.02.2019.
//  Copyright © 2019 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

final class HomeSubScrollableView : UIView {
    
    let title : UILabel = {
        
        let label = UILabel()
        label.text = "Child View"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.bold)
        return label
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(title)
        
        backgroundColor = UIColor.childViewBackground
        layer.cornerRadius = 5
        clipsToBounds = true
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        title.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init (coder) has not been implemented")
    }
    
}
