//
//  SignInView.swift
//  FirebaseAuthTest
//
//  Created by Joshua Segal on 5/27/20.
//  Copyright © 2020 Joshua Segal. All rights reserved.
//

import SwiftUI

struct SignInView : View {

    @State var email: String = ""
    @State var password: String = ""
    @State var loading = false
    @State var error = false

    @EnvironmentObject var session: SessionStore

    func signIn () {
        loading = true
        error = false
        session.signIn(email: email, password: password) { (result, error) in
            self.loading = false
            if error != nil {
                print("failed login")
                self.error = true
            } else {
                print("logged in!")
//                print(result)
                self.email = "SUCCESS"
                self.password = ""
//                session.session = User
            }
        }
    }

    var body: some View {
        VStack {
            TextField("email address", text: $email)
            TextField("Password", text: $password)
//            TextField($email, placeholder: "email address")
//            SecureField($password, placeholder: Text("Password"))
            if (error) {
                Text("ahhh crap")
            }
            Button(action: signIn) {
                Text("Sign in")
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
