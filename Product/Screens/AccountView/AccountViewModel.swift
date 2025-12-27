//
//  AccountViewModel.swift
//  Product
//
//  Created by RatanakVisal on 27/12/25.
//

import Foundation
import Combine

final class AccountViewModel: ObservableObject{
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var dateOfBirth = Date()
    @Published var savePayment = false
    @Published var isLoading = false
    @Published var alertItem: AlertItem?
    
    var isValidForm: Bool {
        guard firstName != "" && lastName != "" && email != "" else {
            alertItem = AlertContext.pleaseInputAllField
            return false
        }
        
        guard email.isValidEmail else {
            alertItem = AlertContext.emailInvalid
            return false
        }
        
        return true
    }
    
    func onSaveChanges(){
        guard isValidForm else {
            return
        }
        isLoading = true
    }
}
