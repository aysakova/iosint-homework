//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Aysa Minkova on 2021/08/19.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    var post: Post? {
        didSet {
            authorLabel.text = post?.author
            postImageView.image = UIImage(named: post!.image)
            descriptionLabel.text = post?.description
            likesLabel.text = String("Likes: \(Int(post!.likes))")
            viewsLabel.text = String("Views: \(Int(post!.views))")
        }
    }

    private var postImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private var authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 2
        label.textColor = .black
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        label.numberOfLines = 0
        return label
    }()

    private var likesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private var viewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
}

extension PostTableViewCell {
    private func setupView() {
        contentView.addSubview(authorLabel)
        contentView.addSubview(postImageView)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(likesLabel)
        contentView.addSubview(viewsLabel)
        
        let constraints = [
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),

            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 12),
            postImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1),
//            postImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 12),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 12),
            likesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),

            viewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 12),
            viewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
        ]
        constraints.forEach({$0.priority = UILayoutPriority(1000)})
        NSLayoutConstraint.activate(constraints)
        
        let constraintsTwo:[NSLayoutConstraint] = []
        constraintsTwo.forEach({$0.priority = UILayoutPriority(1000)})
        NSLayoutConstraint.activate(constraintsTwo)
        
        
//        let ch = postImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
//        ch.priority = UILayoutPriority(1000)
//        ch.isActive = true

        let ch = postImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor)
        ch.priority = UILayoutPriority(999)
        ch.isActive = true

//        let cw = postImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
//        cw.priority = UILayoutPriority(999)
//        cw.isActive = true

        let t = descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 12)
        t.priority = UILayoutPriority(1000)
        t.isActive = true
}
}
