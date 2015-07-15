//
//  LicensingItemCell.swift
//  LicensingViewController
//
//  Created by Tiago Henriques on 15/07/15.
//  Copyright (c) 2015 Tiago Henriques. All rights reserved.
//

import UIKit


class LicensingItemCell: UITableViewCell {

    // MARK: - Constants

    let spacing = 15


    // MARK: - Properties

    let titleLabel = UILabel()
    let noticeLabel = UILabel()


    // MARK: - Lifecycle

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubviews()
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        titleLabel.text = ""
        noticeLabel.text = ""
    }


    // MARK: - Views

    func setupSubviews() {
        titleLabel.numberOfLines = 0
        titleLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        contentView.addSubview(titleLabel)

        noticeLabel.numberOfLines = 0
        noticeLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        contentView.addSubview(noticeLabel)
        
        self.setNeedsUpdateConstraints()
    }

    override func updateConstraints() {
        super.updateConstraints()

        let views = [
            "titleLabel": titleLabel,
            "noticeLabel": noticeLabel
        ]

        let metrics = [
            "spacing": spacing
        ]

        contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|-spacing-[titleLabel]-spacing-|",
            options: nil,
            metrics: metrics,
            views: views
        ))

        contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-spacing-[titleLabel]-[noticeLabel]-spacing-|",
            options: nil,
            metrics: metrics,
            views: views
            ))

        contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|-spacing-[noticeLabel]-spacing-|",
            options: nil,
            metrics: metrics,
            views: views
            ))
    }
    
}
