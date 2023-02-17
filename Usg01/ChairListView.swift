//
//  ChairListView.swift
//  Usg01
//
//  Created by 안병욱 on 2023/02/17.
//

import SwiftUI

struct ChairListView: View {
    
    @State var chairs = [
        Chair(name: "millberget", designer: "테드", MFR: "마이크로소프트"),
        Chair(name: "aleby", designer: "리이오", MFR: "구글"),
        Chair(name: "brommo", designer: "Ted", MFR: "테슬라"),
        Chair(name: "ekedalen", designer: "Leo", MFR: "메타"),
        Chair(name: "markus", designer: "테드", MFR: "삼성"),
        Chair(name: "hattefjall", designer: "Monika Mulder", MFR: "엘지"),
        Chair(name: "nordmyra", designer: "리이오", MFR: "금성"),
        Chair(name: "tunholmen", designer: "USG", MFR: "무림"),
        Chair(name: "ypperlig", designer: "코드스하이", MFR: "순양자동차")
        ]
    
    let chairImages = chairImageArray()
    let allChairs = [
        "hattefjall",
        "aleby",
        "brommo",
        "ekedalen",
        "markus",
        "millberget",
        "nordmyra",
        "tunholmen",
        "ypperlig"
    ]
    
    @State var chairsDic = [String: [String]]()
    
    var body: some View {
        NavigationStack{
            List(chairs, id: \.id) { chair in
                NavigationLink {
                    chairSeller(chairImages: chairsDic[chair.name] ?? [], chair: chair)
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
                        .onAppear() {
                            self.chairsDic = [
                                "hattefjall": chairImages.hattefjall,
                                "aleby": chairImages.aleby,
                                "brommo": chairImages.brommo,
                                "ekedalen": chairImages.ekedalen,
                                "markus": chairImages.markus,
                                "millberget": chairImages.millberget,
                                "nordmyra": chairImages.nordmyra,
                                "tunholmen": chairImages.tunholmen,
                                "ypperlig": chairImages.ypperlig
                            ]
                        }
                    }
                    .navigationTitle(Text("AirCnC"))
                    .navigationBarTitleDisplayMode(.large)
                }
            }
        }
        //chairSeller(chairData: chairImages.markus)
    }
}

struct chairImageArray {
    let hattefjall = ["hattefjall_1","hattefjall_2","hattefjall_3","hattefjall_4","hattefjall_5"]
    let aleby = ["aleby_1","aleby_2","aleby_3","aleby_4","aleby_5","aleby_6","aleby_7"]
    let brommo = ["brommo_1","brommo_2","brommo_3","brommo_4","brommo_5"]
    let ekedalen = ["ekedalen_1","ekedalen_2","ekedalen_3","ekedalen_4","ekedalen_5"]
    let markus = ["markus_1","markus_2","markus_3","markus_4","markus_5","markus_6","markus_7"]
    let millberget = ["millberget_1","millberget_2","millberget_3","millberget_4","millberget_5","millberget_6"]
    let nordmyra = ["nordmyra_1","nordmyra_2","nordmyra_3"]
    let tunholmen = ["tunholmen_1","tunholmen_2","tunholmen_3","tunholmen_4","tunholmen_5"]
    let ypperlig = ["ypperlig_1","ypperlig_2","ypperlig_3","ypperlig_4","ypperlig_5","ypperlig_6","ypperlig_7"]
}

struct Chair {
    let id = UUID()
    let name: String
    let designer: String
    let MFR: String
}


struct ChairListView_Previews: PreviewProvider {
    static var previews: some View {
        ChairListView()
    }
}
