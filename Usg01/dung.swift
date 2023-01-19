//
//  dung.swift
//  Usg01
//
//  Created by 안병욱 on 2023/01/18.
//

import SwiftUI

struct dung: View {
    @State var showTitle: Int = 3
    @State var alertOn: Bool = false
    
    @State var UserID: String?
    @State var UserIDGet: String = ""
    @State var isLoogIn: Bool = false
    
    @State var news: Bool = false
    @State var feature: Bool = false
    @State var WWDC: Bool = false
    @State var TT: Bool = false
    
    @State var sheeet: Bool = false
    @State var APw: String = ""
    @State var On:Bool = false
    @State var isOn:Bool = false
    
    //@Binding var giveData: String 
    
    
    
    var body: some View {
        TabView(selection: $showTitle) {
            Text("안녕하세요.")
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("새로운 발견")
                }.tag(0)
            Text("반갑습니다.")
                .tabItem {
                    Image(systemName: "rectangle.stack.fill")
                    Text("둘러보기")
                }.tag(1)
            Text("행복하세요.")
                .tabItem {
                    Image(systemName: "swift")
                    Text("WWDC")
                }.tag(2)
            NavigationStack {
                List {
                    if isLoogIn {
                        Section{
                            VStack{
                                Text("Ahn ByeongUk")
                                    .bold()
                                    .font(.system(size: 15))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.top,5)
                                Text(UserID!)
                                    .font(.system(size: 12))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.bottom, 5)
                                    .foregroundColor(.secondary)
                            }
                        }
                    } else {
                        //MARK: - confirmationDialog
                        Section{
                            Button("로그인") {
                                self.alertOn = true
                            }.confirmationDialog("로그인", isPresented: $alertOn) {
                                if UserID != nil {
                                    Button(UserID!) {
                                        isLoogIn = true
                                    }
                                }
                                NavigationLink {
                                    NavigationView {
                                        Text("Apple ID로 로그인")
                                            .onAppear() {
                                                self.sheeet = true
                                            }
                                            .sheet(isPresented: $sheeet) {
                                                VStack{
                                                    Text("Apple ID \n")
                                                        .font(.system(size: 40))
                                                    Text("iCloud 및 기타 Apple 서브스에서 사용할 Apple ID로 로그인하십시오.")
                                                        .multilineTextAlignment(.center)
                                                        .frame(width: 300)
                                                    List {
                                                        Text("")
                                                            .font(.system(size: 0))
                                                        HStack{
                                                            Text("Apple ID")
                                                                .bold()
                                                            
                                                            TextField("이메일", text: $UserIDGet)
                                                                .autocapitalization(.none)
                                                                .disableAutocorrection(true)
                                                                .padding(.leading,20)
                                                                .onSubmit {
                                                                    self.On = true
                                                                }
                                                        }
                                                        if self.On == true {
                                                            HStack{
                                                                Text("비밀번호")
                                                                    .bold()
                                                                SecureField("비밀번호", text: $APw)
                                                                    .autocapitalization(.none)
                                                                    .disableAutocorrection(true)
                                                                    .padding(.leading,20)
                                                                    .onSubmit {
                                                                        self.sheeet = false
                                                                        isLoogIn = UserID == "" ? false : true
                                                                        UserID = UserIDGet
                                                                    }
                                                            }
                                                        }
                                                    }
                                                    .listStyle(.plain)
                                                    .environment(\.defaultMinListRowHeight,50)
                                                    .frame(height: self.On ? 200 : 100)
                                                    
                                                    Button("Apple ID가 없거나 잊어버렸습니까?"){
                                                        self.isOn = true
                                                    }.alert("타이틀", isPresented: $isOn, actions: {
                                                        Text("알림")
                                                    })
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
                                } label: {
                                    Text("Apple ID로 로그인")
                                }
                            } message: {
                                Text("기존 iCloud 계정을 사용하여 로그인하거나 다른 Apple ID를 사용하십시오.")
                            }
                        } footer: {
                            Text("Apple Developer 계정 등을 관리하려면 Apple ID로 로그인하십시오")
                        }
                    }
                    
                    Section{
                            NavigationLink {
                                List() {
                                    Section {
                                        Toggle(isOn: $news) {
                                            Text("News Highlights")
                                        }
                                        Toggle(isOn: $feature) {
                                            Text("Featured Stories")
                                        }
                                        Toggle(isOn: $WWDC) {
                                            Text("WWDC")
                                        }
                                        Toggle(isOn: $TT) {
                                            Text("Tech Talks")
                                        }
                                    } footer: {
                                        Text("Apple ID로 Apple Developer 앱에 로그인하고 알림을 활성화한 모든 기기로 알림이 전송됩니다")
                                            .foregroundColor(.secondary)
                                    }
                                    .navigationTitle("알림")
                                    .navigationBarTitleDisplayMode(.inline)
                                }.foregroundColor(.black)
                                
                            } label: {
                                Text("알림")
                            }
                    } footer: {
                            Text("계정, 공지, WWDC 등에 대한 업데이트 수신 방법을 사용자화하십시오.")
                    }
                    if isLoogIn {
                        Section{
                            VStack{
                                Text("Ahn ByeongUk")
                                    .bold()
                                    .font(.system(size: 15))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.top,5)
                                Text(UserID!)
                                    .foregroundColor(.secondary)
                                    .font(.system(size: 12))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.bottom, 5)
                            }
                        } header: {
                            Text("팀")
                        }
                        Section{
                            Button("로그아웃"){
                                isLoogIn = false
                            }
                                .accentColor(.red)
                        }
                    }
                }.navigationTitle("계정")
                //.navigationBarTitleDisplayMode(.inline)
            }
            .tabItem {
                Image(systemName: "person.crop.circle.fill")
                Text("계정")
        }
            .tag(3)
            Text("감사합니다.")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("검색")
                }.tag(4)
        }.onAppear(){
            UITabBar.appearance().backgroundColor = .white
        }
        
    }
}

struct dung_Previews: PreviewProvider {
    static var previews: some View {
        dung()
    }
}
