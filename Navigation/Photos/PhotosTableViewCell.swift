//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Aysa Minkova on 2021/08/23.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    private lazy var photosLabel: UILabel = {
       let label = UILabel()
        label.text = "Photos"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private lazy var arrowImageView: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "arrow.right"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .black
        return image
    }()
    
    private lazy var photoStackView: UIStackView = {
        let stack = UIStackView()
        for i in 0...3 {
            stack.addArrangedSubview(UIImageView(image: UIImage(named: PhotoStorage.photosForView[i].image)))
        }
        stack.contentMode = .scaleAspectFit
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 8
        return stack
                                
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        constraints()
    }
    
    private func setupView() {
        contentView.addSubview(photosLabel)
        contentView.addSubview(arrowImageView)
        contentView.addSubview(photoStackView)
        
        contentView.clipsToBounds = true
        
        let array = photoStackView.arrangedSubviews
        array.forEach({$0.layer.cornerRadius = 6})
        array.forEach({$0.clipsToBounds = true})
        array.forEach({$0.contentMode = .scaleAspectFit})
        array.forEach({$0.backgroundColor = .black})
    }
        private func constraints() {
    
        let constraints = [

            
            photosLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            photosLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),

            arrowImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            arrowImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            photoStackView.leadingAnchor.constraint(equalTo: photosLabel.leadingAnchor),
            photoStackView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 12),
            photoStackView.trailingAnchor.constraint(equalTo: arrowImageView.trailingAnchor),
            photoStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
                    ]
        NSLayoutConstraint.activate(constraints)
            
            let c = photoStackView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25)
            c.priority = UILayoutPriority(999)
            c.isActive = true
    }
    
}
