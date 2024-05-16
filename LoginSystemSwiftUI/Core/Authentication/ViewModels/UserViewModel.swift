////
////  UserViewModel.swift
////  LoginSystemSwiftUI
////
////  Created by Bayu Alif Farisqi on 16/05/24.
////
//
//import Foundation
//import FirebaseAuth
//import FirebaseFirestore
//
//class UserViewModel: ObservableObject{
//    @Published var allUsers : [User] = []
//    
//    private let db = Firestore.firestore()
//    private var userListenerL: ListenerRegistration?
//    
//    init() {
//        Task {
//            await fetchAllUsers()
//        }
//    }
//    
//    //MARK: GET ALL USER
//    func fetchAllUsers() async {
//        do {
//            let querySnapshot = try await db.collection("users").getDocuments()
//            allUsers = querySnapshot.documents.compactMap { document in
//                try? document.data(as: User.self)
//            }
//            print("user list : \(allUsers)")
//        } catch {
//            print("Error fetching all users: \(error.localizedDescription)")
//        }
//    }
//}
