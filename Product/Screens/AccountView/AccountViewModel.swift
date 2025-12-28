//
//  AccountViewModel.swift
//  Product
//
//  Created by RatanakVisal on 27/12/25.
//

import Foundation
import Combine
import SwiftUI

final class AccountViewModel: ObservableObject {
    
    @AppStorage("user") private var userAppStorage: Data?
    
    @Published var userData = User()
    @Published var alertItem: AlertItem?
    
    let decode = JSONDecoder()
    
    var isValidForm: Bool {
        guard userData.firstName != "" && userData.lastName != "" && userData.email != "" else {
            alertItem = AlertContext.pleaseInputAllField
            return false
        }
        
        guard userData.email.isValidEmail else {
            alertItem = AlertContext.emailInvalid
            return false
        }
        
        return true
    }
    
    func onSaveChanges(){
        guard isValidForm else {
            return
        }
        do {
            let data = try JSONEncoder().encode(userData)
            userAppStorage = data
            alertItem = AlertContext.storeUserDataToAppStorageSuccess
        } catch{
            alertItem = AlertContext.storeUserDataToAppStorageError
        }
    }
    func retrieveUser(){
        guard let userAppStorage = userAppStorage else { return }
        
        do{
            userData = try decode.decode(User.self, from: self.userAppStorage ?? Data())
        } catch {
            alertItem = AlertContext.retrieveUserDataToAppStorageError
        }
        
    }
}
