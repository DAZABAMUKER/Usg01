//
//  ContentView.swift
//  Usg01
//
//  Created by 안병욱 on 2023/01/12.
//

import SwiftUI

struct ContentView: View {
    @State var lock: Bool = false
    
    var body: some View {
        VStack {
            Image(systemName: lock ? "heart.circle" : "heart.circle.fill")
                .imageScale(.large)
                .foregroundColor(lock ? .red : .accentColor)
                .onTapGesture {
                    lock.toggle()
                }
                .font(.system(size: lock ? 50 : 20))
            Text(lock ? "잠김": "풀림")


        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
