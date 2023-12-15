//
//  ArticleTableViewCell.swift
//  GoodNewsMVVM
//
//  Created by Ryan Gallagher on 15/12/2023.
//

import Foundation
import UIKit

//class ArticleTableViewCell: UITableViewCell {
//    
//    @IBOutlet weak var titleLabel: UILabel!
//    @IBOutlet weak var authorLabel: UILabel!
//}

class ArticleTableViewCell: UITableViewCell {
    
    //MARK: setup labels and stackview
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    let authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(white: 0.333, alpha: 1)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, authorLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()
    
    //MARK: init and add stackview to subview
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        contentView.addSubview(stackView)
    }
    
    //MARK: Setup constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Constraints for the stackView
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 11),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -11)
        ])
    }


    
}
