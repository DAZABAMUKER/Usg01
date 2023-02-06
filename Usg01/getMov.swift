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
    var body: some View {
        VStack{
            TextField( "장르 검색", text: $inputVal)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .background(border)
                .padding(.horizontal, 40)
                .padding(.vertical, 10)
                .onSubmit {
                    GetResponse()
                }
            List(respo, id: \._id) { Rdata in
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
            /*
            Button {
                GetResponse()
                //makeEncode()
            } label: {
                Text("Get")
                    .padding()
            }
             */

        }.background(.indigo)
    }
    
    
    func GetResponse() {
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
                DispatchQueue.main.async {
                    self.respo = response.data
                }
            }
            catch {
                
            }
        }
        task.resume()
    }
    
    var border: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .frame(height: 40)
                .padding(-20)
                .foregroundColor(Color(UIColor(red: 67/255, green: 66/255, blue: 66/255, alpha: 0.2)))
            RoundedRectangle(cornerRadius: 20)
                .strokeBorder(LinearGradient(gradient: .init(
                    colors: [
                        Color(red: 1, green: 112 / 255.0, blue: 0),
                        Color(red: 226 / 255.0, green: 247 / 255.0, blue: 5 / 255.0)
                    ]),startPoint: .topLeading,endPoint: .bottomTrailing),lineWidth: 4)
                .frame(height: 40)
                .padding(-20)
            
        }
    }
}
func makeEncode() {
    let datas = Movie(title: "타이틀", _id: "아이디", image: "이미지", genre: ["스릴러"])
    let encoder = JSONEncoder()
    let dts = try! encoder.encode(datas)
    print("dts",dts)
}
struct Response: Codable {
    let message: String
    let data: [Movie]
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
