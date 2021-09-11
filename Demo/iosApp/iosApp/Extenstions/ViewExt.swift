//
//  ViewExt.swift
//  ViewExt
//
//  Created by An Nguyen 2 on 9/11/21.
//  Copyright © 2021 orgName. All rights reserved.
//

import SwiftUI

extension View {
    func handleLoadingView(_ isLoading: Binding<Bool>) -> some View {
        ZStack {
            self
                .disabled(isLoading.wrappedValue)
                .opacity(isLoading.wrappedValue ? 0.6: 1)
            
            if isLoading.wrappedValue {
                LoadingView()
            }
        }
    }
}
