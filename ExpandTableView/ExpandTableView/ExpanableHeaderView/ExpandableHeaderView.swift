//
//  ExpandableHeaderView.swift
//  ExpandTableView
//
//  Created by Nguyen on 5/25/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

protocol ExpandableHeaderViewDelegate {
    func toogleSection(header: ExpandableHeaderView, session: Int)
}

class ExpandableHeaderView: UITableViewHeaderFooterView {

    var delegate: ExpandableHeaderViewDelegate?
    var section: Int!

    @IBOutlet weak var sectionLabel: UILabel!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectHeaderAction)))
    }

    @objc func selectHeaderAction(gestureRecognizer: UITapGestureRecognizer) {
        let cell = gestureRecognizer.view as! ExpandableHeaderView
        delegate?.toogleSection(header: self, session: cell.section)
    }

    func customInit(title: String, section: Int, delegate: ExpandableHeaderViewDelegate) {
        self.sectionLabel.text = title
        self.section = section
        self.delegate = delegate
    }
}
