//
//  problem.swift
//  Usg01
//
//  Created by 안병욱 on 2023/01/19.
//

import SwiftUI

struct problem: View {
    @State var dialogOn: Bool = false
    @State var ModalOn: Bool = false
    
    var body: some View {
        Button("다이어로그") {
            self.dialogOn = true
        }
        .confirmationDialog("alertOn", isPresented: $dialogOn) {
            Button("모달") {
                self.ModalOn = true
            }
            .sheet(isPresented: $ModalOn) {
                ContentView(Closs: $ModalOn)
            }
        }
    }
}

struct problem_Previews: PreviewProvider {
    static var previews: some View {
        problem()
    }
}
