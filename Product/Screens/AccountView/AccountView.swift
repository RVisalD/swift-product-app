//
//  AccountView.swift
//  AppetizerApp
//
//  Created by RatanakVisal on 25/12/25.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    
    var body: some View {
        NavigationView{
            Form{
                Section(
                    header: Text("Personal Information")
                ){
                    TextField("First Name", text: $viewModel.firstName)
                    TextField("Last Name", text: $viewModel.lastName)
                    TextField("Email", text: $viewModel.email)
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                    DatePicker("Date of Birth", selection: $viewModel.dateOfBirth, displayedComponents: .date)
                    Button{
                        viewModel.onSaveChanges()
                    } label: {
                      Text("Save Changes")
                            .foregroundColor(.blue)
                    }
                }
                .autocapitalization(.none)
                
                Section(
                    header: Text("Payment")
                ){
                    Toggle("Save Payment", isOn: $viewModel.savePayment)
                }
                .toggleStyle(SwitchToggleStyle(tint: .primaryColor))
            }
            .navigationTitle("😀 Account")
        }
        .alert(item: $viewModel.alertItem){ alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton
            )
        }
    }
}

#Preview {
    AccountView()
}
