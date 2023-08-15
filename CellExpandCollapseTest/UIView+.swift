//
//  UIView+.swift
//  CellExpandCollapseTest
//
//  Created by Dubon Ya'ar on 15/08/2023.
//

import UIKit

public extension UIView {
    func constraintTo(view: UIView, edgeInset: NSDirectionalEdgeInsets? = nil) {
        translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate(
            [leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: edgeInset?.leading ?? 0),
             trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: edgeInset?.trailing ?? 0),
             topAnchor.constraint(equalTo: view.topAnchor, constant: edgeInset?.top ?? 0),
             bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: edgeInset?.bottom ?? 0)])
    }

    func constraintToParent(edgeInset: NSDirectionalEdgeInsets? = nil) {
        guard let superview = superview else { return }
        constraintTo(view: superview, edgeInset: edgeInset)
    }
}
