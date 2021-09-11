//
//  ErrorView.swift
//  ErrorView
//
//  Created by An Nguyen 2 on 8/29/21.
//

import SwiftUI

struct ErrorView: View {
    var error: Error?
    
    private var description: String {
        error?.localizedDescription ?? "Error"
    }
    
    var body: some View {
        ZStack {
            Color.gray
            
            Text("\(description)")
                .foregroundColor(.red)
                .font(.caption2.italic())
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView()
    }
}
