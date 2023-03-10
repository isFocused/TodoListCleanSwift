//
//  ListPresenter.swift
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

protocol ListPresentationLogic {
  func presentSomething(response: List.Something.Response)
}

class ListPresenter: ListPresentationLogic {
  weak var viewController: ListDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: List.Something.Response) {
	  switch response {
	  case .filtred(let complitedTasks, let uncomplitedTasks):
		  let sections = SectionForTaskManagerAdapter().configureSection(with: complitedTasks, and: uncomplitedTasks)
		  viewController?.displaySomething(viewModel: .reload(sections))
	  case .start(let complitedTasks, let uncomplitedTasks):
		  let sections = SectionForTaskManagerAdapter().configureSection(with: complitedTasks, and: uncomplitedTasks)
		  viewController?.displaySomething(viewModel: .initial(sections))
	  }
  }
}
