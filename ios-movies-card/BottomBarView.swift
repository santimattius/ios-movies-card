//
//  BottomBarView.swift
//  ios-movies-card
//
//  Created by Santiago Mattiauda on 18/12/21.
//

import SwiftUI

struct BottomBarView: View {
    var body: some View{
        HStack{
            Image(systemName: "xmark.circle.fill")
                .font(.system(size: 60))
                .foregroundColor(.red)
                .padding(25)
            Image(systemName: "heart.circle.fill")
                .font(.system(size: 60))
                .foregroundColor(.green)
                .padding(25)
        }.padding(15)
    }
}

struct BottomBarView_Previews: PreviewProvider {
    static var previews: some View {
        BottomBarView()
    }
}
