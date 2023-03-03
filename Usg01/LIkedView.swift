//
//  LIkedView.swift
//  Usg01
//
//  Created by 안병욱 on 2023/03/03.
//

import SwiftUI

struct LIkedView: View {
    
    @EnvironmentObject var store: Store
    
    var body: some View {
        List{
            ForEach(store.chairs.filter{$0.isLiked}, id: \.id) { chair in
                NavigationLink {
                    chairSeller(chairImages: store.chairsDic[chair.name] ?? [], chair: chair)
                } label: {
                    HStack{
                        Image(chair.name)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 100)
                        VStack(alignment: .leading){
                            Text(chair.name.uppercased())
                                .font(.title2)
                                .bold()
                            Text("Designer: \(chair.designer)")
                                .foregroundColor(.secondary)
                            Text("MFR: \(chair.MFR)")
                                .foregroundColor(.secondary)
                        }
                        .padding(.vertical)
                    }
                    .navigationTitle(Text("AirCnC"))
                    .navigationBarTitleDisplayMode(.large)
                }
            }
        }
    }
}

struct LIkedView_Previews: PreviewProvider {
    static var previews: some View {
        LIkedView().environmentObject(Store())
    }
}
