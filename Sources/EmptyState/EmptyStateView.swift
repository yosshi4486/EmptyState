//
//  EmptyStateView.swift
//  EmptyState
//
//  Created by yosshi4486 on 2020/04/08
//  
//

import SwiftUI

public struct EmptyStateView<Content> : View where Content : View {
    
    private var content: Content
    
    @State
    private var emptyContent: AnyView
    
    @Binding
    private var empty: Bool
            
    init(empty: Binding<Bool>, @ViewBuilder content: () -> Content) {
        self.content = content()
        
        // Initialized emptyContent from content, Implementation can be simple for several reasons.
        self._emptyContent = .init(initialValue: self.content.eraseToAnyView())
        self._empty = empty
    }
    
    public var body: some View {
        Group<AnyView> {
            if empty {
                return emptyContent
                    .onPreferenceChange(EmptyStatePreferenceKey.self) { (preference) in
                        self.emptyContent = preference.view
                }
                .eraseToAnyView()
            } else {
                return content
                    .onPreferenceChange(EmptyStatePreferenceKey.self) { (preference) in
                        self.emptyContent = preference.view
                }
                .eraseToAnyView()
            }
        }
    }

}
