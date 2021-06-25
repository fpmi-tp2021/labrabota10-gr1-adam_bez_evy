//
//  TextFieldLineView.swift
//  MAnDAr_App
//
//  Created by arizngy on 17/06/2021.

import UIKit

class TextFieldLineView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.backgroundColor = UIColor.white
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
