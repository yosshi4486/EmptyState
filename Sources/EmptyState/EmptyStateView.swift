//
//  EmptyStateView.swift
//  EmptyState
//
//  Created by yosshi4486 on 2020/04/08
//  
//

import SwiftUI

/// A view for presenting empty state items when inner content is empty.
public struct EmptyStateView<Content> : View where Content : View {
    
    private var content: Content
    
    @State
    private var emptyStateItems: AnyView
    
    @Binding
    private var empty: Bool
            
    public init(empty: Binding<Bool>, @ViewBuilder content: () -> Content) {
        self.content = content()
        
        // Initialized emptyContent from content, Implementation can be simple for several reasons.
        self._emptyStateItems = .init(initialValue: self.content.eraseToAnyView())
        self._empty = empty
    }
    
    public var body: some View {
        
        // I don't know the reason but it goes well with using VStack. It doesn't go well with Group.
        VStack<AnyView> {
            if empty {
                return emptyStateItems
                    .onPreferenceChange(EmptyStatePreferenceKey.self) { (preference) in
                        self.emptyStateItems = preference.view
                }
                .eraseToAnyView()
            } else {
                return content
                    .onPreferenceChange(EmptyStatePreferenceKey.self) { (preference) in
                        self.emptyStateItems = preference.view
                }
                .eraseToAnyView()
            }
        }
    }

}

extension View {
    
    /// Configures the empty state items for the view.
    ///
    /// This modifier only takes effect when this view is inside of and visible within a `EmptyStateView`.
    ///
    /// - Parameter items: A view that appears when the content is empty.
    public func emptyStateItems<Items>(@ViewBuilder items: () -> Items) -> some View where Items : View {
        self.preference(key: EmptyStatePreferenceKey.self, value: .init(view: items().eraseToAnyView()))
    }

}

struct EmptyStateView_Previews: PreviewProvider {
    @State static var empty: Bool = true
    
    static var previews: some View {
        EmptyStateView(empty: $empty) {
            Text("isNotEmpty")
                .emptyStateItems {
                    VStack(spacing: 30) {
// Image.init(systemName:) fails on GitHub Actions.
//                        Image(systemName: "person.3")
//                            .scaleEffect(4)
//                            .padding()
                        
                        Text("No mutual friends to show")
                        
                        Button(action: {
                        }) {
                            Text("FIND FRIENDS")
                        }
                        .padding(10)
                        .border(Color.blue, width: 1)
                    }
            }
        }
    }
    
}
