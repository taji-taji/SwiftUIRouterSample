import SwiftUI

public protocol Navigatable where Self: View {
    associatedtype Destination: RouteDestination
    var router: Router { get }
}

public extension Navigatable {
    @ViewBuilder
    func navigatableView<Content: View>(@ViewBuilder content: @escaping () -> Content) -> some View {
        NavigatableView<Content, Destination>(router: router) {
            content()
        }
    }
}

private struct NavigatableView<Content, Destination>: View where Content: View, Destination: RouteDestination {
    private let router: Router
    private let content: () -> Content

    init(router: Router, @ViewBuilder content: @escaping () -> Content) {
        self.router = router
        self.content = content
    }

    var body: some View {
        content()
            .navigationDestination(for: Destination.self) { destination in
                router.view(for: destination)
            }
    }
}
