# EmptyState

![Swift](https://github.com/yosshi4486/EmptyState/workflows/Swift/badge.svg)

An empty state view for SwiftUI.

## Usage
Use `EmptyStateView` as container and `emptyStateItems` modifier inside the container.

```swift
struct ContentView: View {

    var body: some View {
        EmptyStateView {
            Text("MyText")
                .emptyStateItems {
                    Text("EmptyState")
                }
        }
    }

}
```

## Requirements
- iOS13, macOS10.15, tvOS 13, or watchOS 6 later
- Swift 5.2
- Xcode11.4

## Instllation
The preferred way of installing **EmptyState** is via the Swift Package Manager.

1. In Xcode, open your project and navigate to **File** → **Swift Packages** → **Add Package Dependency...**
2. Paste the repository URL(`https://github.com/yosshi4486/EmptyState.git`) and click **Next.**
3. For **Rules**, select Branch(with branch set to `master`).
4. Click **Finish.**

## Contributing
EmptyState is and will always be free and open. I'd appriciate it if you cloud contribute to this project.

Correcting english is very helpful to us :bow:

## License
EmptyState is licensed under the [MIT License](https://github.com/yosshi4486/EmptyState/blob/master/README.md)
