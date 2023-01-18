//
//  leejiwon.swift
//  Usg01
//
//  Created by 안병욱 on 2023/01/18.
//

import SwiftUI

struct leejiwon: View {
    @State var loginSts: Bool = false
    var body: some View {
        List{
            Section{
                Button{
                    loginSts = true
                } label: {
                    if loginSts {
                        Section{
                            Text("안병욱")
                        } footer: {
                            Text("footer입니다")
                        }
                    } else {
                        VStack{
                            Text("실패")
                            Text("입니다.")
                        }
                    }
                }
            }
        }
    }
}

struct leejiwon_Previews: PreviewProvider {
    static var previews: some View {
        leejiwon()
    }
}
