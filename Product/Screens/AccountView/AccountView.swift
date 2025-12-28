//
//  AccountView.swift
//  AppetizerApp
//
//  Created by RatanakVisal on 25/12/25.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField  {
        case firstName, lastName, email
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section(
                    header: Text("Personal Information")
                ){
                    TextField("First Name", text: $viewModel.userData.firstName)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit { focusedTextField = .lastName }
                        .submitLabel(.next)
                    
                    TextField("Last Name", text: $viewModel.userData.lastName)
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit { focusedTextField = .email }
                        .submitLabel(.next)
                    
                    TextField("Email", text: $viewModel.userData.email)
                        .focused($focusedTextField, equals: .email)
                        .onSubmit { focusedTextField = nil }
                        .submitLabel(.continue)
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                    
                    DatePicker("Date of Birth", selection: $viewModel.userData.dateOfBirth, displayedComponents: .date)
                    
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
                    Toggle("Save Payment", isOn: $viewModel.userData.savePayment)
                }
                .toggleStyle(SwitchToggleStyle(tint: .primaryColor))
            }
            .navigationTitle("😀 Account")
            .toolbar{
                ToolbarItemGroup(placement: .keyboard){
                    Button("Dismiss"){
                        focusedTextField = nil
                    }
                }
            }
        }
        .onAppear{
            viewModel.retrieveUser()
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
