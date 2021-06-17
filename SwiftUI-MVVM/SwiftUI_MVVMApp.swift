//
//  SwiftUI_MVVMApp.swift
//  SwiftUI-MVVM
//
//  Created by Kittisak Phetrungnapha on 17/6/2564 BE.
//

import SwiftUI

@main
struct SwiftUI_MVVMApp: App {
    var body: some Scene {
        WindowGroup {
            AnimesContentView(viewModel: AnimesContentViewViewModel())
        }
    }
}
