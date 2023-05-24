//
//  ProfileView.swift
//  ToDo
//
//  Created by Бекжан on 06.05.2023.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    init(){
        
    }
    var body: some View {
        NavigationView {
            VStack {
                //`avatar
                if let user = viewModel.user {
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.blue)
                        .frame(width: 125, height: 125)
                        .padding()
                    // Info .Name, .Email, .member since
                    VStack(alignment: .leading){
                        HStack {
                            Text("Name: ")
                                .bold()
                            Text(user.name)
                        }
                        .padding()
                        HStack {
                            Text("Email: ")
                                .bold()
                            Text(user.email)
                        }
                        .padding()
                        HStack {
                            Text("Member Since: ")
                                .bold()
                            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                        }
                        .padding()
                    }
                    .padding()
                    Button("Log Out"){
                        viewModel.logOut()
                    }
                    .tint(.red)
                    .padding()
                    Spacer()
                } else {
                    Text("Loading profile ...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear{
            viewModel.fetch()
        }
    }
    @ViewBuilder
    func profile(user: User) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 125, height: 125)
            .padding()
        // Info .Name, .Email, .member since
        VStack(alignment: .leading){
            HStack {
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            .padding()
            HStack {
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            .padding()
            HStack {
                Text("Member Since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
        }
        .padding()
        Button("Log Out"){
            viewModel.logOut()
        }
        .tint(.red)
        .padding()
        Spacer()
    }
}
struct ProfileView_Previews: PreviewProvider {
        static var previews: some View {
            ProfileView()
            
        }
}
