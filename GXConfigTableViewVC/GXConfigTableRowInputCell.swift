//
//  GXConfigTableRowInputCell.swift
//  GXConfigTableViewVCSample
//
//  Created by Gin on 2023/10/31.
//

import UIKit

public class GXConfigTableRowInputCell: GXConfigTableRowDefaultCell {

    lazy var textField: UITextField = {
        let input = UITextField(frame: .zero)
        input.textAlignment = .right
        input.keyboardType = .default
        input.returnKeyType = .done
        input.clearsOnBeginEditing = true

        return input
    }()

    public func bind<T: GXConfigTableRowInputModel>(model: T, type: T.Type) {
        super.bind(model: model, type: GXConfigTableRowInputModel.self)

        if let detailColor = model.detailColor {
            self.textField.textColor = detailColor
        }
        self.textField.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: model.inputSize)
        self.textField.placeholder = model.inputPlaceholder
        self.textField.keyboardType = model.keyboardType
        (self.textField.rx.textInput <-> model.input).disposed(by: disposeBag)
        self.accessoryView = self.textField
    }
}
