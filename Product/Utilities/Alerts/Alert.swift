 //
//  Alert.swift
//  Product
//
//  Created by RatanakVisal on 26/12/25.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext{
    // MARK: -- API Call Error Alert
    static let invalidData = AlertItem(title: Text("Server Error"),
                                       message: Text("The data received from the server is invalid. Please contact support."),
                                       dismissButton: .default(Text("OK")))
    static let invalidResponse = AlertItem(title: Text("Server Error"),
                                           message: Text("Invalid response from the server. Please contact support."),
                                           dismissButton: .default(Text("OK")))
    static let invalidURL = AlertItem(title: Text("Server Error"),
                                      message: Text("There is an issue connecting to the server. Please contact support."),
                                      dismissButton: .default(Text("OK")))
    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                            message: Text("Unable to connect to complete your request at this time. Please contact support."),
                                            dismissButton: .default(Text("OK")))
    
    // MARK: -- Form Error Alert
    static let pleaseInputAllField = AlertItem(title: Text("Invalid Form"),
                                               message: Text("Please make sure you fill in all the fields."),
                                               dismissButton: .default(Text("Ok")))
    static let emailInvalid = AlertItem(title: Text("Invalid Email Address"),
                                               message: Text("Please input a valid email address."),
                                               dismissButton: .default(Text("Ok")))
    static let storeUserDataToAppStorageSuccess = AlertItem(title: Text("User Data Saved"),
                                               message: Text("User Data has been successfully saved to AppStorage."),
                                               dismissButton: .default(Text("Ok")))
    static let storeUserDataToAppStorageError = AlertItem(title: Text("Error Saving User Data"),
                                               message: Text("Unable to save user data to AppStorage. Please try again later."),
                                               dismissButton: .default(Text("Ok")))
    static let retrieveUserDataToAppStorageError = AlertItem(title: Text("Error Retrieving User Data"),
                                               message: Text("Unable to retrieve user data from AppStorage. Please try again later."),
                                               dismissButton: .default(Text("Ok")))
    
}
