//
//  AnimesContentView.swift
//  SwiftUI-MVVM
//
//  Created by Kittisak Phetrungnapha on 17/6/2564 BE.
//

import SwiftUI

struct AnimesContentView: View {
    var viewModel: AnimesContentViewViewModel!
    
    var body: some View {
        Text("Hello, World!")
            .onAppear {
                viewModel.fetchAnimes()
            }
    }
}

struct AnimesContentView_Previews: PreviewProvider {
    static var previews: some View {
        AnimesContentView(viewModel: AnimesContentViewViewModel())
    }
}
