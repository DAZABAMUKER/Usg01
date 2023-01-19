//
//  sdf.swift
//  Usg01
//
//  Created by 안병욱 on 2023/01/19.
//

import SwiftUI

struct sdf: View {
    @Binding var Clo
    
    var body: some View {
        Button("로긴") {
            self.alertOun = false
            self.moddal = true
        }
        .sheet(isPresented: $moddal) {
            ContentView(Closs: $moddal)
        }
    }
}

struct sdf_Previews: PreviewProvider {
    static var previews: some View {
        sdf()
    }
}
