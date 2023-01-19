//
//  tttst.swift
//  Usg01
//
//  Created by 안병욱 on 2023/01/19.
//

import SwiftUI

struct tttst: View {
    var body: some View {
        Form{
            Text("텍스트")
            Button("sss") {
                
            }.buttonStyle(.plain)
            //Text("입니다.")
        }
    }
}

struct tttst_Previews: PreviewProvider {
    static var previews: some View {
        tttst()
    }
}
