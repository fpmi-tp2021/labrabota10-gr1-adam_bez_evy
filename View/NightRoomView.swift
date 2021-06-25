//
//  NightRoomView.swift
//  MAnDAr_App
//
//  Created by arizngy on 24/06/2021.

import UIKit

class NightRoomView: UIView {
    
    let minusLabel: UIButton = {
       let ml = UIButton()
        //ml.textAlignment = .center
        //ml.textColor = UIColor.darkGray
        ml.translatesAutoresizingMaskIntoConstraints = false
        //ml.font = UIFont.systemFont(ofSize: 13)
        ml.setTitle("-", for: .normal)
        ml.backgroundColor = UIColor.orange
        ml.addTarget(self, action: #selector(minusClick), for: .touchUpInside)
        //ml.text = "-"
        return ml
    }()
    
    let plusLabel: UIButton = {
        let pl = UIButton()
        //pl.textAlignment = .center
        //pl.textColor = UIColor.darkGray
        pl.translatesAutoresizingMaskIntoConstraints = false
        //pl.font = UIFont.systemFont(ofSize: 13)
        pl.setTitle("+", for: .normal)
        pl.backgroundColor = UIColor.orange
        //pl.text = "+"
        pl.addTarget(self, action: #selector(plusClick), for: .touchUpInside)
        return pl
    }()
    
    let valueLabel: UILabel = {
        let pl = UILabel()
        pl.textAlignment = .center
        pl.textColor = UIColor.darkGray
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.font = UIFont.systemFont(ofSize: 13)
        pl.text = "1"
        return pl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = UIColor.init(white: 0.95, alpha: 1)
        addSubview(minusLabel)
        addSubview(plusLabel)
        addSubview(valueLabel)
    }
    
    @objc func plusClick()
    {
        valueLabel.text = String(Int(valueLabel.text ?? "0")! + 1)
    }
    
    @objc func minusClick()
    {
        let currentNumber = Int(valueLabel.text ?? "0")!
        if (currentNumber > 1)
        {
            valueLabel.text = String(Int(valueLabel.text ?? "0")! - 1)
        }
    }
    func setupConstraints() {
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0(20)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":minusLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":minusLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v0(20)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":plusLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":plusLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[v0(20)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":valueLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":valueLabel]))
    }
    
}
