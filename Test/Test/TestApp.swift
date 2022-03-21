//
//  TestApp.swift
//  Test
//
//  Created by Saim Khan on 20/03/2022.
//

import SwiftUI

@main
struct TestApp: App {
    var body: some Scene {
        WindowGroup {
            if #available(iOS 15.0, *) {
                ContentView()
            } else {
                // Fallback on earlier versions
            }
        }
    }
}
