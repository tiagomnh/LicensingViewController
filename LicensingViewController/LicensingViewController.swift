//
//  LicensingViewController.swift
//  LicensingViewController
//
//  Created by Tiago Henriques on 07/07/2015.
//

import UIKit

public class LicensingViewController: UITableViewController {


    // MARK: Constants

    private let reuseIdentifier = "LicensingItemCell"
    

    // MARK: Properties

    public var items: [LicensingItem] = [] {
        didSet { tableView.reloadData() }
    }
    
    public var titleFont = UIFont.boldSystemFontOfSize(18) {
        didSet { tableView.reloadData() }
    }

    public var titleColor = UIColor.blackColor() {
        didSet { tableView.reloadData() }
    }

    public var noticeFont = UIFont.systemFontOfSize(13) {
        didSet { tableView.reloadData() }
    }

    public var noticeColor = UIColor.darkGrayColor() {
        didSet { tableView.reloadData() }
    }


    // MARK: Lifecycle

    override public func viewDidLoad() {
        tableView.registerClass(LicensingItemCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.estimatedRowHeight = 400
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.tableFooterView = UIView()
    }

}


// MARK: UITableViewDataSource

extension LicensingViewController {

    override public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let item = items[indexPath.row] as LicensingItem

        let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier) as? LicensingItemCell

        cell?.titleLabel.text = item.title
        cell?.titleLabel.font = titleFont
        cell?.titleLabel.textColor = titleColor

        cell?.noticeLabel.text = item.notice()
        cell?.noticeLabel.font = noticeFont
        cell?.noticeLabel.textColor = noticeColor

        cell?.userInteractionEnabled = false
        
        cell?.layoutIfNeeded()

        return cell ?? UITableViewCell()
    }

}
