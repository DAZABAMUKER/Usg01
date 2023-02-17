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
    
    let chairImages: [String]
    let chair: Chair
    
    @State var dateClick = false
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
        .padding(.vertical,20)
        .padding(.horizontal, 40)
        .padding(.bottom)
        .background(LinearGradient(colors: [Color.brown.opacity(0.4), Color.white], startPoint: .bottom, endPoint: .top))
    }
    var body: some View {
        ScrollView{
            VStack(){
                //Spacer()
                ZStack{
                    Image(chairImages[image_index])
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                    //.border(.red)
                    HStack{
                        Button {
                            if self.image_index == 0{
                                self.image_index = chairImages.count - 1
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
                            if self.image_index == chairImages.count - 1 {
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
                .onAppear(){
                    print(chairImages)
                }
                Text(chair.name.uppercased())
                    .bold()
                    .font(.title)
                    .italic()
                    .frame(alignment: .center)
                Text("제조사: \(chair.MFR), 디자이너: \(chair.designer)")
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
                    Image("qwe")
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
                Button {
                    self.dateClick = true
                } label: {
                    Text("\(date, formatter: dateFormatter)")
                }
                if dateClick {
                    VStack{
                        DatePicker("날짜", selection: $date, in: Date()..., displayedComponents: [.date])
                            .datePickerStyle(.wheel)
                            .padding()
                        Button("확인"){
                            self.dateClick = false
                        }
                    }
                }
            }
        }
        //.border(.red)
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
        chairSeller(chairImages: chairImageArray().ypperlig, chair: Chair(name: "ypperlig", designer: "코드스하이", MFR: "순양자동차"))
    }
}
