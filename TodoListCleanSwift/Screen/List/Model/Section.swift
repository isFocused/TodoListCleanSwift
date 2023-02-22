//
//  Section.swift
//  TodoListCleanSwift
//
//  Created by Denis Ivanov on 23.02.2023.
//

enum Section {
	
	case completed([RegularTask])
	case uncompleted([RegularTask])
	
	/// The property describes the title of the section
	var title: String {
		switch self {
		case .completed:
			return "Completed"
		case .uncompleted:
			return "Uncompleted"
		}
	}
}
