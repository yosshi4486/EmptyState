//
//  EmptyStateView.swift
//  EmptyState
//
//  Created by yosshi4486 on 2020/04/08
//  
//

import SwiftUI

public struct EmptyStateView<Content, EmptyContent> : View where Content : View, EmptyContent : View {
    
    private var content: Content
    
    private var emptyContent: EmptyContent
    
    @Binding
    private var empty: Bool
            
    init(empty: Binding<Bool>, @ViewBuilder content: () -> Content, @ViewBuilder emptyContent: () -> EmptyContent) {
        self.content = content()
        self.emptyContent = emptyContent()
        self._empty = empty
    }
    
    public var body: some View {
        if empty {
            return emptyContent.eraseToAnyView()
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
