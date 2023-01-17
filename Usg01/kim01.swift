//
//  kim01.swift
//  Usg01
//
//  Created by 안병욱 on 2023/01/16.
//

import SwiftUI

struct kim01: View {
    @State var showTitle: Int = 3
    @State var alertOn: Bool = false
    
    @State var news: Bool = false
    @State var feature: Bool = false
    @State var WWDC: Bool = false
    @State var TT: Bool = false
    
    
    @State var Login: Bool = false
    private var email: String?
    
    var body: some View {
        TabView(selection: $showTitle) {
            Text("안녕하세요")
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("새로운 발견")
                }.tag(0)
            Text("안녕하세요")
                .tabItem {
                    Image(systemName: "rectangle.stack.fill")
                    Text("둘러보기")
                }.tag(1)
            Text("안녕하세요")
                .tabItem {
                    Image(systemName: "swift")
                    Text("WWDC")
                }.tag(2)
            NavigationStack {
                List {
                    if Login {
                        Section{
                            VStack{
                                Text("Ahn ByeongUk")
                                    .bold()
                                    .font(.system(size: 15))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.top,5)
                                Text("wookis112@gmail.com")
                                    .accentColor(.secondary)
                                    .font(.system(size: 12))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.bottom, 5)
                            }
                        }
                    } else {
                        Section{
                            Button("로그인") {
                                print("로그인")
                                self.alertOn = true
                            }.confirmationDialog("로그인", isPresented: $alertOn) {
                                if email != nil {
                                    Button("wookis112@gmail.com") {
                                        Login = true
                                    }
                                }
                                Button("Apple ID로 로그인") {
                                }
                            } message: {
                                Text("기존 iCloud 계정을 사용하여 로그인하거나 다른 Apple ID를 사용하십시오.")
                            }
                            
                            //.alert(title:Text("로그인위한"), isPresented: $showTitle) {
                            //Alert(title: Text("로그인"))
                            //}
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
                    if Login {
                        Section{
                            VStack{
                                Text("Ahn ByeongUk")
                                    .bold()
                                    .font(.system(size: 15))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.top,5)
                                Text("wookis112@gmail.com")
                                    .accentColor(.secondary)
                                    .font(.system(size: 12))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.bottom, 5)
                            }
                        } header: {
                            Text("팀")
                        }
                        Section{
                            Button("로그아웃"){
                                self.Login = false
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
        }.tag(3)
            Text("안녕하세요")
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

