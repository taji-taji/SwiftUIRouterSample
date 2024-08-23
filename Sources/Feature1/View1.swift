import SwiftUI
import Router

public struct View1: View {
    public enum Destination: RouteDestination {
        case view2
        case view3(fromView: String)
    }

    @EnvironmentObject private var router: Router

    public init() {}

    public var body: some View {
        VStack {
            Text("View1")
            Button("to View2") {
                router.navigate(to: Destination.view2)
            }
            Button("to View3") {
                router.navigate(to: Destination.view3(fromView: "View1"))
            }
        }
        .navigationDestination(for: Destination.self) { destination in
            router.view(for: destination)
        }
        .navigationTitle("View1")
    }
}

#Preview {
    RootView(
        viewProvider: { _ in
            Text("aaaa")
        },
        content: {
            View1()
        }
    )
}
