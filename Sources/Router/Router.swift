import SwiftUI

public protocol RouteDestination: Hashable, Codable {}

public final class Router: ObservableObject {
    @Published var path = NavigationPath()
    public let viewProvider: (any RouteDestination) -> AnyView

    public init(@ViewBuilder _ viewProvider: @escaping (any RouteDestination) -> some View) {
        self.viewProvider = { destination in
            AnyView(viewProvider(destination))
        }
    }

    public func view<Destination: RouteDestination>(for destination: Destination) -> some View {
        viewProvider(destination)
    }

    public func push<Destination: RouteDestination>(to destination: Destination) {
        path.append(destination)
    }

    public func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }

    public func popToRoot() {
        path = .init()
    }
}
