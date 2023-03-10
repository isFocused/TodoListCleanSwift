//
//  ListInteractor.swift
//  TodoListCleanSwift
//
//  Created by Denis Ivanov on 23.02.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ListBusinessLogic {
  func doSomething(request: List.Something.Request)
}

protocol ListDataStore {
  
}

class ListInteractor: ListBusinessLogic, ListDataStore {
  var presenter: ListPresentationLogic?
  var worker: ListWorker?
  
  // MARK: Do something
  
	func doSomething(request: List.Something.Request) {
		switch request {
		case .start:
			worker = ListWorker()
			worker?.setupTasks()
			guard let tupleTask = worker?.doSomeWork() else { return }
			presenter?.presentSomething(response: .start(complitedTasks: tupleTask.0, uncomplitedTasks: tupleTask.1))
		case .update(let sections, let id):
			searchTask(sections: sections, id: id)
			guard let tupleTask = worker?.doSomeWork() else { return }
			presenter?.presentSomething(response: .filtred(complitedTasks: tupleTask.0, uncomplitedTasks: tupleTask.1))
		}
	}
	
	func searchTask(sections: [Section], id: UUID) {
		sections.forEach {
			switch $0 {
			case .completed(let model), .uncompleted(let model):
				model.forEach {
					if $0.id == id {
						$0.id = id
					}
				}
			}
		}
	}
}
