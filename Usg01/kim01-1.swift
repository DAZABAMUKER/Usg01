//
//  kim01-1.swift
//  Usg01
//
//  Created by 안병욱 on 2023/01/16.
//

import SwiftUI

struct kim01_1: View {
    @State var sheeet: Bool = false
    @State var AId: String = ""
    @State var On:Bool = false
    
    var body: some View {
        Text("Apple ID로 로그인")
            .onAppear() {
                self.sheeet = true
            }
            .sheet(isPresented: $sheeet) {
                VStack{
                    Text("Apple ID \n")
                        .font(.system(size: 40))
                    Text("iCloud 및 기타 APple 서브스에서 사용할 Apple ID로 로그인하십시오.\n\n")
                        .multilineTextAlignment(.center)
                        .frame(width: 300)
                    List {
                        //Text("")
                        HStack{
                            Text("Apple ID")
                                .bold()

                            TextField("이메일", text: $AId)
                                .padding(.leading,20)
                                .onSubmit {
                                    self.On = true
                                }
                        }
                        if self.On == true {
                            Text("비밀번호")
                                .bold()
                        }
                    }
                        .listStyle(.plain)
                        .environment(\.defaultMinListRowHeight,60)
                        .frame(height: self.On ? 150 : 70)
                    
                    Button("Apple ID가 없거나 잊어버렸습니까?"){
                        Alert(title: Text("로그인"))}
                        .font(.system(size: 20))
                        .bold()
                        .padding(.top,10)
                    HStack{
                        Image("qwe").resizable().aspectRatio(1, contentMode: .fit)
                        Image("asd").resizable().aspectRatio(1, contentMode: .fit)
                        Image("qwe").resizable().aspectRatio(1, contentMode: .fit)
                        Image("asd").resizable().aspectRatio(1, contentMode: .fit)
                        Image("qwe").resizable().aspectRatio(1, contentMode: .fit)
                        Image("asd").resizable().aspectRatio(1, contentMode: .fit)
                    }.frame(width: 300,height: 100)
                    .padding(.top)
                    .font(.system(size: 30))
                    Text("Apple ID는 모든 Apple 서비스를 이용할 때 사용하는 계정입니다.")
                        .multilineTextAlignment(.center)
                        .frame(width: 430)
                        .padding(.top, -15)
                        .padding(.bottom, 20)
                    Image(systemName: "person.line.dotted.person")
                        .padding(.all)
                        .foregroundColor(.blue)
                        .font(.system(size: 25))
                    Text("사용자가 Apple ID로 로그인하면, 기기를 교체하거나 복원해야 하는 경우를 대비하여 자동으로 데이터를 기기이 백업하는iCloud 백업 등의 Apple 서비스를 활성화하기 위해 사용자의 Apple ID 정보가 사용됩니다. 사용자의 일련 번호는 서비스 제공 적합성을 확인하는데 사용될 수 있습니다. 사용자의 데이터가 어떻게 관리되는지 보기...")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 12))
                        .frame(width: 350)
                        .foregroundColor(.secondary)
                    Spacer()
                }//.background(.secondary)

            }
    }
}

struct kim01_1_Previews: PreviewProvider {
    static var previews: some View {
        kim01_1()
    }
}
