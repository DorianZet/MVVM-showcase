//
//  SubtitleTableViewCell.swift
//  MVVM presentation - TableView
//
//  Created by Mateusz Zacharski on 22/11/2020.
//

import UIKit

class SubtitleTableViewCell: UITableViewCell { // a custom table view cell for displaying subtitles.

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
