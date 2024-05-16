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
    @Published var allUsers : [User] = []
    
    private let db = Firestore.firestore()
    private var userListener: ListenerRegistration?
    
    init(){
//        self.userSession = Auth.auth().currentUser
        Task{
            await fetchCurrentUser()
            await fetchAllUsers()
        }
    }
    
    //MARK: SIGN IN
    func signIn(withEmail email: String, password: String) async throws -> Bool{
        do{
            let signInResult = try await Auth.auth().signIn(withEmail: email, password: password)
            print("ok masuk")
            if signInResult.user.isEmailVerified{
                try await updateEmailVerificationStatus(for: signInResult.user)
                self.userSession = signInResult.user
                await fetchAllUsers()
                await fetchCurrentUser()
                
                return true
            }else{
                print("masuk 2")
                throw NSError(domain: "Email Verification", code: 0, userInfo: [NSLocalizedDescriptionKey: "Sistem Login dengan Swift dan Firebase"])
            }
        }catch{
            throw error
        }
    }
    
    //MARK: CREATE USER
    func createUser(withEmail email: String, password: String, fullname:String) async throws -> Bool{
        do{
            //register email
            let createUserResult = try await Auth.auth().createUser(withEmail: email, password: password)
            
            //send email verification link
            try await createUserResult.user.sendEmailVerification()
            
            //collect data and store to firestore database
            let user = User(id: createUserResult.user.uid, fullName: fullname, email: email, isEmailVerified: false)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await db.collection("users").document(user.id).setData(encodedUser)
            
            return true
            
        }catch{
            throw error
        }
    }
    
    //MARK: FORGOT PASSWORD
    func forgotPassword(withEmail email: String) async throws ->Bool {
        do{
            try await Auth.auth().sendPasswordReset(withEmail: email)
            return true
        }catch{
            throw error
        }
    }
    
    //MARK: SIGN OUT
    func signOut(){
        do{
            try Auth.auth().signOut() //sign out on back end
            self.userSession = nil 
            self.currentUser = nil
        } catch{
            print("ERROR: Failed to create user with error\(error.localizedDescription)")
        }
        
    }
   
    //MARK: GET CURRENT USER
    func fetchCurrentUser()async{
        guard let user = Auth.auth().currentUser else {return}
        print(user.isEmailVerified)
        guard let uid = Auth.auth().currentUser?.uid else{return}
        
        do{
            let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
            self.currentUser = try snapshot.data(as: User.self)
            
        }catch{
            print("ERROR: Failed to get user with error\(error.localizedDescription)")
        }
    }
    
    func fetchAllUsers() async {
        print("mauks boy")
        do {
            let querySnapshot = try await db.collection("users").getDocuments()
            allUsers = querySnapshot.documents.compactMap { document in
                try? document.data(as: User.self)
            }
            print("user list : \(allUsers)")
        } catch {
            print("Error fetching all users: \(error.localizedDescription)")
        }
    }
    
    //MARK: UPDATE EMAIL VERIFICATION
    func updateEmailVerificationStatus(for user: FirebaseAuth.User) async throws {
    do {
        try await db.collection("users").document(user.uid).updateData(["isEmailVerified": true])
    } catch {
        throw error
        }
    }
}
