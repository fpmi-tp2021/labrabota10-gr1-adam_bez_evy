//
//  CloseDrawerView.swift
//  MAnDAr_App
//
//  Created by arizngy on 19/06/2021.

import UIKit

class CloseDrawerView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = UIColor.init(white: 0.5, alpha: 0.5)
    }
    
}
