//
//  ChairListView.swift
//  Usg01
//
//  Created by 안병욱 on 2023/02/17.
//

import SwiftUI

struct ChairListView: View {
    
    @EnvironmentObject var store: Store
    var body: some View {
        NavigationStack{
            List(store.chairs, id: \.id) { chair in
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



struct Chair {
    let id = UUID()
    let name: String
    let designer: String
    let MFR: String
    var isLiked: Bool = false
}


struct ChairListView_Previews: PreviewProvider {
    static var previews: some View {
        ChairListView().environmentObject(Store())
    }
}
