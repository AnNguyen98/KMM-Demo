//
//  LoadingView.swift
//  MoviesTrailer
//
//  Created by An Nguyen 2 on 8/29/21.
//

import SwiftUI

struct LoadingView: View {
    
    @State var isAnimating: Bool = false
    
    @Environment(\.redactionReasons) var redactionReasons
        
    var body: some View {
        HStack {
//            if #available(iOS 15.0, *) {
//                if redactionReasons.contains(.privacy) {
//                    Text("[HIDDEN]")
//                } else {
//                    Text("1234 5678 9012 3456")
//                }
//            } else {
//                // Fallback on earlier versions
//            }
            
            ForEach(0..<3) { index in
                Circle()
                    .foregroundColor(.green)
                    .frame(width: 15, height: 15, alignment: .center)
                    .scaleEffect(isAnimating ? 1.5: 0)
                    .animation(
                        Animation.linear(duration: 0.6).repeatForever(autoreverses: true).delay(0.2 * Double(index))
                    )
            }
        }
        .onAppear(perform: {
            withAnimation{
                isAnimating = true
            }
        })
            
//        RoundedRectangle(cornerRadius: 5)
//            .size(width: 50.0, height: 10)
//            .padding(20)
//            .offset(x: isAnimating ? UIScreen.main.bounds.width - 90: 0)
//            .animation(
//                Animation.linear(duration: 1).repeatForever(autoreverses: true)
//            )
//            .foregroundColor(.green)
//            .onAppear(perform: {
//                isAnimating = true
//            })
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
