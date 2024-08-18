import SwiftUI

public struct RootView<Content>: View where Content: View {
    @StateObject var router: Router
    private let content: () -> Content

    public init(
        @ViewBuilder viewProvider: @escaping (any RouteDestination) -> some View,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = content
        self._router = StateObject(wrappedValue: Router(viewProvider))
    }

    public var body: some View {
        NavigationStack(path: $router.path) {
            content()
        }
        .environmentObject(router)
    }
}
