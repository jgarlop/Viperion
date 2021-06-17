//
//  UITextField.swift
//  Viperion
//
//  Created by Javier García López on 17/6/21.
//

import UIKit

extension UITextField {
    enum Side {
        case left, right
    }

    /// Adds image to the desired side (horizontal) of the textfield, with a padding and size
    /// - Parameters:
    ///     - side: The place, horizontally, to place the image: left or right
    ///     - image: UIImage to be placed
    ///     - size: Size of the image
    ///     - padding: Desired padding around the image, default is zero.
    func addImage(side: Side, image: UIImage?, size: Double, padding: Double = 0) {
        guard let image = image else { return }

        let containerView = UIView()
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        containerView.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.size.equalTo(size)
            $0.edges.equalToSuperview().inset(padding)
        }

        switch side {
        case .left:
            self.leftViewMode = .always
            self.leftView = containerView
        case .right:
            self.rightViewMode = .always
            self.rightView = containerView
        }
    }
}
