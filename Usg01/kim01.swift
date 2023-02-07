//
//  kim01.swift
//  Usg01
//
//  Created by 안병욱 on 2023/01/16.
//

import SwiftUI

struct kim01: View {
    @AppStorage("UsrID") var UsrID: String = UserDefaults.standard.string(forKey: "UserID") ?? ""
    @AppStorage("isLogIn") var isLogIn: Bool = UserDefaults.standard.bool(forKey: "isLogIn")
    
    @State var showTitle: Int = 3
    @State var alertOn: Bool = false
    @State var alertOun: Bool = false
    
    @State var news: Bool = false
    @State var feature: Bool = false
    @State var WWDC: Bool = false
    @State var TT: Bool = false
    
    @State var datas: [String] = ["리이오","링고", "영", "테드"]
    @State var inputs: String = ""
    
    @State var moddal: Bool = false
    var body: some View {
            TabView(selection: $showTitle) {
                Text("안녕하세용")
                    .tabItem {
                        Image(systemName: "star.fill")
                        Text("새로운 발견")
                    }.tag(0)
                problem()
                    .tabItem {
                        Image(systemName: "rectangle.stack.fill")
                        Text("둘러보기")
                    }.tag(1)
                ContentView(Closs: .constant(true))
                    .tabItem {
                        Image(systemName: "swift")
                        Text("WWDC")
                    }.tag(2)
                NavigationStack {
                    ZStack{
                        List {
                            if isLogIn {
                                Section{
                                    VStack{
                                        Text("Ahn ByeongUk")
                                            .bold()
                                            .font(.system(size: 15))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.top,5)
                                        Text(UsrID)
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
                                        if UsrID != "" {
                                            Button(UsrID) {
                                                isLogIn = true
                                            }
                                        }
                                        NavigationLink {
                                            kim01_1()
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
                                .onAppear(){
                                    if UsrID != "" {
                                        isLogIn = true
                                    }
                                }
                            } footer: {
                                Text("계정, 공지, WWDC 등에 대한 업데이트 수신 방법을 사용자화하십시오.")
                            }
                            //MARK: - 리이오2번째
                            Section {
                                ForEach(self.datas, id: \.self){ dats in
                                    NavigationLink{
                                        Text(dats)
                                    } label:{
                                        Text(dats)
                                        
                                    }
                                }
                            }
                            Section {
                                Button("모달"){
                                    self.moddal = true
                                }
                                .sheet(isPresented: $moddal) {
                                    ContentView(Closs: $moddal)
                                }
                            }
                            if isLogIn {
                                Section{
                                    VStack{
                                        Text("Ahn ByeongUk")
                                            .bold()
                                            .font(.system(size: 15))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.top,5)
                                        Text(UsrID)
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
                                        isLogIn = false
                                    }
                                    .accentColor(.red)
                                }
                            }
                        }.navigationTitle("계정")
                        //.navigationBarTitleDisplayMode(.inline)
                        
                        VStack{
                            Spacer()
                            TextField("입력하세요", text: $inputs)
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                                .padding(10)
                                .font(.system(size: 20))
                                .background(.white)
                                .onSubmit {
                                    datas.append(self.inputs)
                                    self.inputs = ""
                                }
                            Button("추가"){
                                datas.append(self.inputs)
                                self.inputs = ""
                            }
                            //.background(.red)
                            .buttonStyle(.borderedProminent)
                        }
                        //.background(.red)
                    }
                }
                .tabItem {
                    Image(systemName: "person.crop.circle.fill")
                    Text("계정")
                }
                .tag(3)
                chairSeller()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("검색")
                    }.tag(4)
            }.onAppear(){
                UITabBar.appearance().backgroundColor = .white
            }
            
    }
}

struct kim01_Previews: PreviewProvider {
    static var previews: some View {
        kim01()
    }
}

