//
//  ListRegularViewCell.swift
//  TodoListCleanSwift
//
//  Created by Denis Ivanov on 23.02.2023.
//

import UIKit

protocol ListCellDelefgate: AnyObject {
	
	func updateCellStte(by id: UUID)
}

final class ListRegularViewCell: UITableViewCell {

	private var model: RegularTask?
	weak var delegate: ListCellDelefgate?
	private var id: UUID?
	
	@IBOutlet var checkBox: ListCheckBox!
	@IBOutlet private var titleLabel: UILabel!
	
	func setupCell(by task: RegularTask) {
		model = task
		id = task.id
		checkBox.isSelected = task.isComplited
		checkBox.delegate = self
		titleLabel.text = task.title
	}
}

extension ListRegularViewCell: ListCheckBoxDelegate {
	
	func updateAction() {
		model?.isComplited.toggle()
		if let id = id {
			delegate?.updateCellStte(by: id)
		}
	}
}
