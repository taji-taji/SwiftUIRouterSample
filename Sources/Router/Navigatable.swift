import SwiftUI

public protocol Navigatable where Self: View {
    associatedtype Destination: RouteDestination
}

public extension Navigatable {
    @ViewBuilder
    func navigatableView<Content: View>(@ViewBuilder content: @escaping () -> Content) -> some View {
        NavigatableView<Content, Destination> {
            content()
        }
    }
}

private struct NavigatableView<Content, Destination>: View where Content: View, Destination: RouteDestination {
    @EnvironmentObject private var router: Router
    private let content: () -> Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    var body: some View {
        content()
            .navigationDestination(for: Destination.self) { destination in
                router.view(for: destination)
            }
    }
}
