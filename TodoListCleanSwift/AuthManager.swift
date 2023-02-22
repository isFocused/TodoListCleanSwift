//
//  AuthManager.swift
//  TodoListCleanSwift
//
//  Created by Denis Ivanov on 23.02.2023.
//

import Foundation

protocol IAuthManager {
	
	func login(with username: String, and password: String, completion: @escaping (AuthManager.AuthState) -> Void)
}

final class AuthManager: IAuthManager {
	
	private enum Constants {
		
		static let login = "Admin"
		static let password = "pa$$32!"
	}
	
	enum AuthState {
		
		case incorrectPassword
		case invalidLogin
		case successfully
	}
	
	func login(with username: String, and password: String, completion: @escaping (AuthState) -> Void) {
		if username != Constants.login {
			DispatchQueue.global().asyncAfter(deadline: .now() + 5) {
				completion(.invalidLogin)
			}
			return
		}
		
		if password != Constants.password {
			DispatchQueue.global().asyncAfter(deadline: .now() + 5) {
				completion(.invalidLogin)
			}
			return
		}
		
		DispatchQueue.global().asyncAfter(deadline: .now() + 5) {
			completion(.successfully)
		}
	}
}
