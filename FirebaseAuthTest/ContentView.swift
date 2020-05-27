//
//  ContentView.swift
//  FirebaseAuthTest
//
//  Created by Joshua Segal on 5/27/20.
//  Copyright © 2020 Joshua Segal. All rights reserved.
//

import SwiftUI
import Firebase
import GoogleSignIn
struct ContentView : View {

  @EnvironmentObject var session: SessionStore

  func getUser () {
      print("hi")
      session.listen()
  }
    func signOut () {
         print("hi")
         session.signOut()
     }

  var body: some View {
    VStack {
      if (session.session != nil) {
//        print("print statement sanity test")
        VStack{
            Text("Hello user!")
            Text(Auth.auth().currentUser!.uid)
            Text(session.session!.email!)
            
            Button(action: signOut) {
                Text("Sign out")
            }
        }
      } else {
        VStack{
            SignInView()
            SignUpView()
            google()
        }
      }
    }.onAppear(perform: getUser)
  }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .environmentObject(SessionStore())
    }
}


struct google : UIViewRepresentable {
    

    func makeUIView(context: UIViewRepresentableContext<google>) -> GIDSignInButton {
        
        let button = GIDSignInButton()
        button.colorScheme = .dark
        GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.last?.rootViewController
        return button
    }
    func updateUIView(_ uiView: GIDSignInButton, context: UIViewRepresentableContext<google>) {
        
    }
}
