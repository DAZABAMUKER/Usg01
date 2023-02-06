//
//  getMov.swift
//  Usg01
//
//  Created by 안병욱 on 2023/01/30.
//

import SwiftUI

struct getMov: View {
    @State var respo = [Movie]()
    @State var inputVal = ""
    @State var isresultsEmpty = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView{
                VStack(spacing: 0){
                    HStack{
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.backward")
                                .foregroundColor(.white)
                                .padding(10)
                        }

                        border(geometry)
                            .padding(10)
                    }
                    if !isresultsEmpty {
                        List(respo, id: \._id) { Rdata in
                            NavigationLink(destination: detailView(_id: Rdata._id)){
                                HStack{
                                    AsyncImage(url: URL(string: "http://mynf.codershigh.com:8080\(Rdata.image)")){ img in
                                        img.image?
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(height: 100)
                                    }
                                    Text(Rdata.title)
                                }
                            }
                            .preferredColorScheme(.dark)
                        }
                        //.frame(width: geometry.size.width ,height: geometry.size.height - 120)
                        .listStyle(.plain)
                        .ignoresSafeArea(.all, edges: .bottom)
                        .background(.black)
                    } else {
                        Text("\n검색 결과 없음.")
                            .foregroundColor(.white)
                        Spacer()
                    }
                }
                .background(.black)
                
            }
        }.navigationBarBackButtonHidden(true)
    }
    
    
    func GetResponse(inputs: String) {
        let urlStr = "http://mynf.codershigh.com:8080/api/movies?genre=\(inputVal)"
        let UrlEncode = urlStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = URL(string: UrlEncode)!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, URLResponse, error in
            if error != nil || data == nil {
                return
            }
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(Response.self, from: data!)
                let resultCount = response.total
                if resultCount == 0 {
                    self.isresultsEmpty = true
                    print(resultCount)
                    //return
                } else {
                    self.isresultsEmpty = false
                }
                DispatchQueue.main.async {
                    self.respo = response.data
                    
                }
            }
            catch {
                
            }
        }
        task.resume()
    }
    
    func border( _ geometry: GeometryProxy) -> some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 40)
                //.padding(.trailing,-5)
                .foregroundColor(Color(UIColor(red: 67/255, green: 66/255, blue: 66/255, alpha: 1)))
            /*RoundedRectangle(cornerRadius: 10)
                .strokeBorder(LinearGradient(gradient: .init(
                    colors: [
                        Color(red: 1, green: 112 / 255.0, blue: 0),
                        Color(red: 226 / 255.0, green: 247 / 255.0, blue: 5 / 255.0)
                    ]),startPoint: .topLeading,endPoint: .bottomTrailing),lineWidth: 2)
                .frame(height: 40)
                //.padding(.trailing,-5)
                //.padding(.leading, -20)
             */
            HStack{
                Image(systemName: "magnifyingglass")
                .resizable()
                .foregroundColor(.gray)
                .frame(width: 20, height: 20)
                TextField( "검색", text: $inputVal)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .foregroundColor(.white)
                    .modifier(PlaceholderStyle(showPlaceHolder: inputVal.isEmpty, placeholder: "검색"))
                    //.background(.red)
                    .onSubmit {
                        GetResponse(inputs: inputVal)
                    }
                if !inputVal.isEmpty {
                    Button {
                        inputVal = ""
                    } label: {
                        Image(systemName: "x.circle.fill")
                            .foregroundColor(.white)
                            .padding(.trailing, 10)
                    }

                }
                    
            }
            .padding(.leading, 10)
            //.frame(width: geometry.size.width - 100)
        }
    }
}
func makeEncode() {
    let datas = Movie(title: "타이틀", _id: "아이디", image: "이미지", genre: ["스릴러"])
    let encoder = JSONEncoder()
    let dts = try! encoder.encode(datas)
    print("dts",dts)
}
struct Response: Decodable {
    let message: String
    let data: [Movie]
    let total: Int
    
    enum CodingKeys: String, CodingKey {
        case message
        case data
        case total
        
        case paging
    }
    
    init(from decoder: Decoder) throws {
        let Contaniner = try decoder.container(keyedBy: CodingKeys.self)
        self.data = try Contaniner.decode([Movie].self, forKey: .data)
        self.message = try Contaniner.decode(String.self, forKey: .message)
        
        let pagingContainer = try Contaniner.nestedContainer(keyedBy: CodingKeys.self, forKey: .paging)
        self.total = try pagingContainer.decode(Int.self, forKey: .total)
    }
    
}

struct Movie: Codable {
    let title: String
    let _id: String
    let image: String
    let genre: [String]
}


struct getMov_Previews: PreviewProvider {
    static var previews: some View {
        getMov()
    }
}
