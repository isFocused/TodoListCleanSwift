//
//  ListImportantViewCell.swift
//  TodoListCleanSwift
//
//  Created by Denis Ivanov on 23.02.2023.
//

import UIKit

final class ListImportantViewCell: UITableViewCell {

	private var model: RegularTask?
	weak var delegate: ListCellDelefgate?
	private var id: UUID?
	
	@IBOutlet private var checkBox: ListCheckBox!
	@IBOutlet private var indicatorImageView: UIImageView!
	@IBOutlet private var titleLabel: UILabel!
	@IBOutlet private var deadlineLabel: UILabel!
	
	
	func setupCell(by task: ImportantTask) {
		model = task
		id = task.id
		let formatter = DateFormatter()
		formatter.dateFormat = "dd.MM.y"
		contentView.backgroundColor = task.deadlineDate < Date() ? .systemPink : .white
		checkBox.isSelected = task.isComplited
		checkBox.delegate = self
		titleLabel.text = task.title
		indicatorImageView.image = configureImage(priority: task.priority)
		deadlineLabel.text = formatter.string(from: task.deadlineDate)
	}
	
	private func configureImage(priority: Priority) -> UIImage? {
		switch priority {
		case .low:
			return UIImage(named: "low-priority")
		case .normal:
			return UIImage(named: "medium-priority")
		case .height:
			return UIImage(named: "high-priority")
		}
	}
}

extension ListImportantViewCell: ListCheckBoxDelegate {
	
	func updateAction() {
		model?.isComplited.toggle()
		if let id = id {
			delegate?.updateCellStte(by: id)
		}
	}
}
