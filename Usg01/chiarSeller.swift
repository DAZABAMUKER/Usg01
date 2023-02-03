//
//  chiarSeller.swift
//  Usg01
//
//  Created by 안병욱 on 2023/02/03.
//

import SwiftUI

struct chiarSeller: View {
    var info: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack{
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                Text("Dazabamuker")
                    //.font(.headline)
                    .font(.system(size: 20))
                    .italic()
                    .padding(.leading, 25)
                Spacer()
            }
            HStack{
                Text("가격")
                    .frame(width: 60, alignment: .leading)
                Text("￦ 279,000")
            }
            HStack{
                Text("깊이")
                    .frame(width: 60, alignment: .leading)
                Text("68 cm")
            }
            HStack{
                Text("폭")
                    .frame(width: 60, alignment: .leading)
                Text("68 cm")
            }
            HStack{
                Text("높이")
                    .frame(width: 60, alignment: .leading)
                Text("110 cm")
            }
            HStack(spacing: 50){
                Spacer()
                Text("장바구니 담기")
                    .foregroundColor(.white)
                    .background(Rectangle().cornerRadius(8).foregroundColor(.blue).padding(-8).padding(.horizontal,-8))
                
                Text("구매하기")
                    .foregroundColor(.white)
                    .background(Rectangle().cornerRadius(8).foregroundColor(.green).padding(-8).padding(.horizontal,-8))
                
            }
            .padding(.top,20)
        }
        .padding(.horizontal, 40)
        .padding(.bottom)
        .background(LinearGradient(colors: [Color.brown.opacity(0.4), Color.white], startPoint: .bottom, endPoint: .top))
    }
    var body: some View {
        VStack(){
            Spacer()
            Image("chair01")
                .resizable()
                .scaledToFit()
                //.border(.red)
            Text("HATTEFJÄLL")
                .bold()
                .font(.title)
                .italic()
                .frame(alignment: .center)
            Text("제조사: IKEA, 디자이너: Monika Mulder")
                .foregroundColor(.secondary)
            HStack(spacing: 10){
                Spacer()
                Image(systemName: "paperplane.circle.fill")
                    .resizable()
                    .foregroundColor(.green)
                    .frame(width: 30,height: 30)
                Image("myApp")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 30,height: 30)
                Image("kakaoTalk")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 30,height: 30)
            }
            .padding(.trailing, 20)
            info
        }
        
        
        
        
    }
}

struct chiarSeller_Previews: PreviewProvider {
    static var previews: some View {
        chiarSeller()
    }
}
