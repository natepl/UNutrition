//
//  AuthModel.swift
//  UNutrition
//
//  Created by Nathaniel Parry Luff on 11/11/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

protocol AuthenticationFormProtocol {
    var validForm: Bool {get}
}


@MainActor
class AuthModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        Task {
            await getUser()
        }
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await getUser()
        } catch {
            print("Failed to log in")
        }
    }
    
    func createUser(withEmail email: String, password: String, name: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, name: name, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await getUser()
            
        } catch {
            print("Failed to create user")
        }
    }
    
    func signOut(){
        do {
            try Auth.auth().signOut()
            self.userSession = nil // sets user session to nil so it takes back to log in
            self.currentUser = nil // resets to no current user
        } catch {
            print("Failed to sign out")
        }
    }
    
    func deleteAccount(){
        
    }
    
    func getUser() async {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        guard let s = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        
        self.currentUser = try? s.data(as: User.self)
    }
    
}
