//
//  AuthViewModel.swift
//  LoginSystemSwiftUI
//
//  Created by Bayu Alif Farisqi on 15/05/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

protocol AuthenticationFormProtocol{
    var formIsValid: Bool {get}
}

@MainActor
class AuthViewModel: ObservableObject{
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init(){
        self.userSession = Auth.auth().currentUser
        
        Task{
            await fetchUser()
        }
    }
    func signIn(withEmail email: String, password: String) async throws{
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        }catch{
            print("ERROR: Failed to login user with error\(error.localizedDescription)")
        }
    }
    
    func createUser(withEmail email: String, password: String, fullname:String) async throws{
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullName: fullname, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
        }catch{
            print("ERROR: Failed to create user with error\(error.localizedDescription)")
        }
    }
    
    func signOut(){
        do{
            try Auth.auth().signOut() //sign out on back end
            self.userSession = nil 
            self.currentUser = nil
        } catch{
            print("ERROR: Failed to create user with error\(error.localizedDescription)")
        }
        
    }
    func deleteAccount(){
        
    }
    func fetchUser()async{
        guard let uid = Auth.auth().currentUser?.uid else{return}
        
        do{
            let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
            self.currentUser = try snapshot.data(as: User.self)
            
        }catch{
            print("ERROR: Failed to get user with error\(error.localizedDescription)")
        }
    }
}
