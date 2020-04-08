//
//  EmptyStateView.swift
//  EmptyState
//
//  Created by yosshi4486 on 2020/04/08
//  
//

import SwiftUI

extension View {
    
    func emptyStateItems<EmptyStateItems>(@ViewBuilder items: () -> EmptyStateItems) -> some View where EmptyStateItems : View {
        return EnvironmentReaderView<Self, EmptyStateContentsKey>(content: self, modifier: .init(value: EmptyStatePreference(view: AnyView(items()))))
    }
    
}

struct EmptyStateView<Content> : View where Content : View {
    
    private var content: Content
    
    @Binding
    private var empty: Bool
        
    init(empty: Binding<Bool>, @ViewBuilder content: () -> Content) {
        self.content = content()
        self._empty = empty
    }
    
    var body: some View {
        if empty {
            return content.emptyStateItems {
                VStack {
                    Text("Image")
                    Spacer()
                    Text("Title")
                    Spacer()
                    Text("Description")
                }
            }.eraseToAnyView()
        } else {
            return content.eraseToAnyView()
        }
    }
    
}

// I think it is not best way but it runs.
private extension View {
    
    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
    
}
