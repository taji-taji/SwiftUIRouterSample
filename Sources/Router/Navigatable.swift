import SwiftUI

public protocol Navigatable where Self: View {
    associatedtype Destination: RouteDestination
    var router: Router { get }
}

public extension Navigatable {
    func navigateBack() {
        router.back()
    }
    
    func navigateBackToRoot() {
        router.backToRoot()
    }
    
    func navigate(to destination: Destination) {
        router.navigate(to: destination)
    }
    
    func rootView(with destination: Destination) -> RootView<AnyView> {
        RootView(viewProvider: router.viewProvider) {
            AnyView(router.view(for: destination))
        }
    }
}

public extension View {
    func navigatable<D>(for destinationType: D.Type) -> some View where D: RouteDestination {
        modifier(_Navigatable<D>())
    }
}

private struct _Navigatable<Destination>: ViewModifier where Destination: RouteDestination {
    @EnvironmentObject private var router: Router
    init() {}
    
    func body(content: Content) -> some View {
        content
            .navigationDestination(for: Destination.self) { destination in
                router.view(for: destination)
            }
    }
}

@attached(extension, conformances: Navigatable)
@attached(member, names: named(router))
public macro Navigatable() = #externalMacro(module: "NavigatableMacros", type: "NavigatableMacro")
