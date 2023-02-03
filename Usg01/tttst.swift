//
//  tttst.swift
//  Usg01
//
//  Created by 안병욱 on 2023/01/19.
//

import SwiftUI
var heights: CGFloat = 180
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
            Image("pig")
                .resizable()
                .frame(width: heights/9*16, height: heights/9*12)
                .clipShape(Rectangle().size(width: heights/9*16, height: heights).offset(x: 0, y: heights/6))
                .frame(width: heights/9*16, height: heights)

                .border(.red)
        }
    }
}

struct tttst_Previews: PreviewProvider {
    static var previews: some View {
        tttst()
    }
}
