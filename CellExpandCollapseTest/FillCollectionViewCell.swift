//
//  FillCellCollectionViewCell.swift
//  CellExpandCollapseTest
//
//  Created by Dubon Ya'ar on 15/08/2023.
//

import UIKit

class FillCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func configure() {
        self.backgroundColor = .red
        //    self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
}
