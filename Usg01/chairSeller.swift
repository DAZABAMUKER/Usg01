//
//  chiarSeller.swift
//  Usg01
//
//  Created by 안병욱 on 2023/02/03.
//

import SwiftUI

struct chairSeller: View {
    
    @State var date = Date()
    @State var isheart: Bool = false
    
    let hattefjall_image_array = ["hattefjall_1","hattefjall_2","hattefjall_3","hattefjall_4","hattefjall_5"]
    @State var image_index = 0
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
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
                VStack(alignment: .leading){
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
                }
                VStack(alignment: .leading){
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
                }
            }
            purchase()
        }
        .padding(.horizontal, 40)
        .padding(.bottom)
        .background(LinearGradient(colors: [Color.brown.opacity(0.4), Color.white], startPoint: .bottom, endPoint: .top))
    }
    var body: some View {
        VStack(){
            //Spacer()
            ZStack{
                Image(hattefjall_image_array[image_index])
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                //.border(.red)
                HStack{
                    Button {
                        if self.image_index == 0{
                            self.image_index = hattefjall_image_array.count - 1
                        } else {
                            self.image_index -= 1
                        }
                    } label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .bold()
                            .scaledToFit()
                            .frame(width: 20)
                            .padding()
                    }
                    Spacer()
                    Button {
                        if self.image_index == hattefjall_image_array.count - 1 {
                            self.image_index = 0
                        } else {
                            self.image_index += 1
                        }
                    } label: {
                        Image(systemName: "chevron.right")
                            .resizable()
                            .bold()
                            .scaledToFit()
                            .frame(width: 20)
                            .padding()
                    }
                }
            }
            Text("HATTEFJÄLL")
                .bold()
                .font(.title)
                .italic()
                .frame(alignment: .center)
            Text("제조사: IKEA, 디자이너: Monika Mulder")
                .foregroundColor(.secondary)
            HStack(spacing: 10){
                Spacer()
                Button{
                    isheart.toggle()
                } label: {
                    Image(systemName: isheart ? "heart.fill" : "heart")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 30)
                        .foregroundColor(.blue)
                }
                
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
            Text("\(date, formatter: dateFormatter)")
            Form {
                DatePicker("날짜", selection: $date, in: Date()..., displayedComponents: [.date])
                    .datePickerStyle(.automatic)
                    .padding()
                
            }
        }
    }
}


struct purchase: View {
    var body: some View {
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
}
struct chairSeller_Previews: PreviewProvider {
    static var previews: some View {
        chairSeller()
    }
}
