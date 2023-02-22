//
//  SectionForTaskManagerAdapter.swift
//  TodoListCleanSwift
//
//  Created by Denis Ivanov on 23.02.2023.
//

import Foundation

/// The class creates sections for later display
final class SectionForTaskManagerAdapter {
	
	/// The method creates sections for later use by the controller's presenter
	/// - Parameter presenter: The parent presenter with which the cell presenters will be configured
	/// - Returns: Child item presenters
	func configureSection(with completionTasks: [RegularTask], and unCompletionTasks: [RegularTask]) -> [Section] {
		[
			.completed(completionTasks),
			.uncompleted(unCompletionTasks)
		]
	}
}
