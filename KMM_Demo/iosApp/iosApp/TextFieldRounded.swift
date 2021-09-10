//
//  TextFieldRounded.swift
//  TextFieldRounded
//
//  Created by An Nguyen 2 on 9/9/21.
//  Copyright © 2021 orgName. All rights reserved.
//

import SwiftUI

struct TextFieldRounded: View {
    let placeholder: String
    var iconName: String
    var text: Binding<String>
    var isScureField: Bool = false
    
    @State private var isScureFieldState: Bool = true
    
    var body: some View {
        HStack {
            Label(
                title: {
                    if isScureFieldState {
                        SecureField(placeholder, text: text)
                    } else {
                        TextField(placeholder, text: text)
                    }
                },
                icon: { Image(systemName: iconName).frame(width: 30) }
            )
            
            if isScureField {
                Button(action: {
                    isScureFieldState.toggle()
                }, label: {
                    Image(systemName: !isScureFieldState ? "eye.fill": "eye.slash.fill")
                })
                    .foregroundColor(.gray)
            }
            
        }
        .frame(minHeight: 40)
        .padding(.horizontal, 6)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.gray, lineWidth: 1)
        )
        
    }
}
