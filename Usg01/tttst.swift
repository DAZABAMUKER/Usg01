//
//  tttst.swift
//  Usg01
//
//  Created by 안병욱 on 2023/01/19.
//

import SwiftUI

struct tttst: View {
    var body: some View {
        VStack{
            /*
            Text("안녕하세요, 세상!")
                .background(.green)
            Text("Hello, World!")
                .background(.green)
                .padding()
                .border(.black)
             */
            Image("fim")
                //.resizable()
                //.frame(width: 480, height: 360)
                .clipShape(Rectangle().size(width: 480, height: 480/192*108).offset(x: 0, y: 180 - 240/192*108))
                .frame(width: 480, height: 480/192*108)

                .border(.green)
        }
    }
}

struct tttst_Previews: PreviewProvider {
    static var previews: some View {
        tttst()
    }
}
