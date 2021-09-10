//
//  TextValidate.swift
//  TextValidate
//
//  Created by An Nguyen 2 on 9/9/21.
//  Copyright © 2021 orgName. All rights reserved.
//

import SwiftUI

struct TextValidate: View {
    var content: String = ""
    var isValidate: Bool = false
    
    var body: some View {
        Label(
            title: {
                Text(content)
                    .strikethrough(!isValidate)
            },
            icon: { Image(systemName: "checkmark.circle") }
        )
        .font(.caption2.italic())
        .foregroundColor(isValidate ? .green: .red)
        .padding(.leading, 4)
    }
}

struct TextValidate_Previews: PreviewProvider {
    static var previews: some View {
        TextValidate()
    }
}
