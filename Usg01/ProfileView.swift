//
//  ProfileView.swift
//  Usg01
//
//  Created by 안병욱 on 2023/03/03.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack{
            Image(systemName: "person")
            Text("Name")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
