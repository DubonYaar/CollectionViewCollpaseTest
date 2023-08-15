//
//  CollpaingCell.swift
//  CellExpandCollapseTest
//
//  Created by Dubon Ya'ar on 15/08/2023.
//

import Combine
import UIKit
class CollapsingCollectionViewCell: UICollectionViewCell {
    private var content: UILabel!
    private var subscriptions: Set<AnyCancellable> = .init()
    let collapse: CurrentValueSubject<Bool, Never> = .init(false)
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
}

private extension CollapsingCollectionViewCell {
    func configure() {
        // Stack view
        let stackView: UIStackView = .init()
        stackView.axis = .vertical
        stackView.alignment = .center
        addSubview(stackView)
        stackView.constraintToParent()
        stackView.backgroundColor = .blue
        stackView.spacing = 10

        // Switch
        let collapseSwitch: UISwitch = .init()
        collapseSwitch.publisher(for: .valueChanged)
            .compactMap { _ in collapseSwitch.isOn }
            .sink { [weak self] in self?.content.isHidden = $0 }
            .store(in: &subscriptions)
        stackView.addArrangedSubview(collapseSwitch)

        // Collpaing Content
        content = UILabel()
        content.text = "CONTENT"
        content.textAlignment = .center
        content.backgroundColor = .white
        content.translatesAutoresizingMaskIntoConstraints = false
        content.heightAnchor.constraint(equalToConstant: 100).isActive = true
        content.widthAnchor.constraint(equalToConstant: 200).isActive = true
        stackView.addArrangedSubview(content)
    }
}
