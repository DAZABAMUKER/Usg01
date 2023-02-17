//
//  Selection.swift
//  Usg01
//
//  Created by 안병욱 on 2023/01/17.
//

import SwiftUI

struct Selection: View {
    var body: some View {
        NavigationStack {
            VStack{
                Spacer()
                Text("USG iOS과정")
                    .font(.system(size: 50))
                    .bold()
                    .foregroundColor(.white)
                    .shadow(radius: 5)
                    .offset(x: 0,y: -120)
                HStack{
                    Spacer()
                    NavigationLink {
                        ChairListView()
                    } label: {
                        VStack{
                            ZStack{
                                Rectangle()
                                    .fill(LinearGradient(colors: [
                                        Color.pink,
                                        Color(red: 253 / 255, green: 138 / 255, blue: 138 / 255)
                                    ],
                                                         startPoint: .topTrailing,
                                                         endPoint: .bottomLeading))
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(20)
                                Image(systemName: "swift")
                                    .resizable()
                                    .foregroundColor(.white)
                                    .frame(width:70,height: 70)
                            }
                            Text("기초반")
                                .bold()
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                        }
                        .shadow(radius: 5)
                    }
                    NavigationLink {
                        kim01()
                    } label: {
                        VStack{
                            ZStack{
                                Rectangle()
                                    .fill(LinearGradient(colors: [
                                        Color(red: 0, green: 129 / 255.0, blue: 201/255),
                                        Color(red: 134 / 255.0, green: 229 / 255.0, blue: 1)
                                    ],
                                                         startPoint: .topLeading,
                                                         endPoint: .bottomTrailing))
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(20)
                                Image(systemName: "swift")
                                    .resizable()
                                    .foregroundColor(.white)
                                    .frame(width:70,height: 70)
                            }
                            Text("심화반")
                                .bold()
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                        }
                        .shadow(radius: 5)
                    }
                    .padding(.leading)
                    Spacer()
                }
                Spacer()
            }
            .background(LinearGradient(colors: [Color(red: 255/255, green: 201/255, blue: 60/255), Color.orange], startPoint: .top, endPoint: .bottom))
            .background(ignoresSafeAreaEdges: Edge.Set.all)
            
        }
    }
}

struct Selection_Previews: PreviewProvider {
    static var previews: some View {
        Selection()
    }
}
