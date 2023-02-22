//
//  ListDataSourse.swift
//  TodoListCleanSwift
//
//  Created by Denis Ivanov on 23.02.2023.
//

import UIKit

final class ListDataSourse: NSObject,  UITableViewDataSource {
	
	var sections: [Section] = []
	var handler: ((UUID) -> Void)?
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		switch sections[section] {
		case .completed(let tasks), .uncompleted(let tasks):
			return tasks.count
		}
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		sections.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		switch sections[indexPath.section] {
		case .completed(let tasks), .uncompleted(let tasks):
			if let task = tasks[indexPath.row] as? ImportantTask {
				let cell = tableView.dequeueReusableCell(withIdentifier: "Important", for: indexPath) as! ListImportantViewCell
				cell.setupCell(by: task)
				cell.delegate = self
				return cell
			} else {
				let cell = tableView.dequeueReusableCell(withIdentifier: "Regular", for: indexPath) as! ListRegularViewCell
				cell.setupCell(by: tasks[indexPath.row])
				cell.delegate = self
				return cell
			}
		}
	}
	
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		sections[section].title
	}
}

extension ListDataSourse: ListCellDelefgate {
	func updateCellStte(by id: UUID) {
		handler?(id)
	}
}

