//
//  Usg01App.swift
//  Usg01
//
//  Created by 안병욱 on 2023/01/12.
//

import SwiftUI

@main
struct Usg01App: App {
    @StateObject var store = Store()
    
    var body: some Scene {
        WindowGroup {
            Selection().environmentObject(store)
        }
    }
}
