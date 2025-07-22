//
//  SideMenuView.swift
//  FalconeAppPlanets
//
//  Created by apple on 22/07/25.
//

import SwiftUI

struct SideMenuView: View {
    @State private var showImagePicker = false
    @State private var profileImage: UIImage? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Profile Image
            Button(action: {
                showImagePicker = true
            }) {
                if let image = profileImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                } else {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.gray)
                }
            }
            .padding(.top, 50)

            Text("Palla Kumar")
            Text("Home")
            Text("About")
            Text("Settings")
            Text("Logout")
            Spacer()
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(UIColor.systemGray6))
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(selectedImage: $profileImage)
        }
    }
}
