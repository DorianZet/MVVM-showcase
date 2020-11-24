//
//  BreachView.swift
//  MVVM presentation
//
//  Created by Mateusz Zacharski on 22/11/2020.
//

import UIKit

class BreachView: UIView { // A view should contain the visual layout of its subviews. In this case, the whole view is just a label.
    public var titleLabel: UILabel!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false

        let titleFrame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        backgroundColor = .systemBackground
        titleLabel = UILabel(frame: titleFrame)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .label
        addSubview(titleLabel)
            
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
