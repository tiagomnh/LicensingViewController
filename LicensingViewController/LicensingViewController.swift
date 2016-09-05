//
//  LicensingViewController.swift
//  LicensingViewController
//
//  Created by Tiago Henriques on 07/07/2015.
//

import UIKit

public class LicensingViewController: UITableViewController {


    // MARK: Constants

    fileprivate let reuseIdentifier = "LicensingItemCell"
    

    // MARK: Properties

    open var items: [LicensingItem] = [] {
        didSet { tableView.reloadData() }
    }
    
    open var titleFont = UIFont.boldSystemFont(ofSize: 18) {
        didSet { tableView.reloadData() }
    }

    open var titleColor = UIColor.black {
        didSet { tableView.reloadData() }
    }

    open var noticeFont = UIFont.systemFont(ofSize: 13) {
        didSet { tableView.reloadData() }
    }

    open var noticeColor = UIColor.darkGray {
        didSet { tableView.reloadData() }
    }

    open var cellBackgroundColor = UIColor.white {
        didSet { tableView.reloadData() }
    }

    // MARK: Lifecycle

    override open func viewDidLoad() {
        tableView.register(LicensingItemCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.estimatedRowHeight = 400
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.tableFooterView = UIView()
    }

}


// MARK: UITableViewDataSource

extension LicensingViewController {

    override open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[(indexPath as NSIndexPath).row] as LicensingItem

        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? LicensingItemCell

        cell?.titleLabel.text = item.title
        cell?.titleLabel.font = titleFont
        cell?.titleLabel.textColor = titleColor

        cell?.noticeLabel.text = item.notice()
        cell?.noticeLabel.font = noticeFont
        cell?.noticeLabel.textColor = noticeColor
        
        cell?.backgroundColor = cellBackgroundColor
        
        cell?.isUserInteractionEnabled = false
        
        cell?.layoutIfNeeded()

        return cell ?? UITableViewCell()
    }

}
