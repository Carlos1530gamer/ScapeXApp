//
//  LaunchCell.swift
//  ScpaceXApp
//
//  Created by Carlos Daniel Hernandez on 24/08/21.
//

import UIKit

final class LaunchCell: UITableViewCell {
    
    private enum Constants {
        static let kBorderWidth: CGFloat = 2
    }

    @IBOutlet private weak var missionNameLabel: UILabel!
    @IBOutlet private weak var upperContainerView: UIView!
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var pathImageView: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var rocketNameLabel: UILabel!
    @IBOutlet private weak var rocketTypeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setup(with model: Launch) {
        pathImageView.load(from: model.links.missionPatch)
        descriptionLabel.text = model.details
        rocketNameLabel.text = model.rocket.name
        rocketTypeLabel.text = model.rocket.type
        missionNameLabel.text = model.missionName
    }
    
    private func setupUI() {
        self.backgroundColor = .black
        self.containerView.backgroundColor = .clear
        selectionStyle = .none
        descriptionLabel.numberOfLines = .zero
        descriptionLabel.textColor = .white
        rocketNameLabel.textColor = .white
        rocketTypeLabel.textColor = .white
        missionNameLabel.textColor = .white
        setupCellBorder()
    }
    
    private func setupCellBorder() {
        containerView.layer.borderWidth = Constants.kBorderWidth
        containerView.layer.borderColor = UIColor.white.cgColor
        upperContainerView.layer.borderWidth = Constants.kBorderWidth
        upperContainerView.layer.borderColor = UIColor.white.cgColor
    }
}
