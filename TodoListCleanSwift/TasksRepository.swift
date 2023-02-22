//
//  TasksRepository.swift
//  TodoListCleanSwift
//
//  Created by Denis Ivanov on 23.02.2023.
//

import Foundation

/// Protocol describing task storage functionality
protocol IRepository: AnyObject {
	
	/// Creates mock objects for testing and passes them to the task manager
	func setTasks()
}

/// Class describing the implementation of the repository for receiving tasks
final class TasksRepository: IRepository {
	
	private let taskManager: ITaskManager
	
	/// An initializer that creates a repository from an object of type ITaskManager
	/// - Parameter taskManager: Object of type ITaskManager
	init(taskManager: ITaskManager) {
		self.taskManager = taskManager
	}
	
	/// Creates mock objects for testing and passes them to the task manager
	func setTasks() {
		[
			RegularTask(title: "Task"),
			RegularTask(isCompleted: true, title: "Regular task"),
			ImportantTask(priorety: .height, title: "Important task height"),
			ImportantTask(priorety: .normal, title: "Important task"),
			ImportantTask(priorety: .low, title: "Important task low"),
			ImportantTask(priorety: .low, isCompleted: true, title: "Important task")
			
		].forEach { taskManager.add($0) }
	}
}

