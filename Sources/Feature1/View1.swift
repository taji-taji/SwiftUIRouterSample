import SwiftUI
import Router

public struct View1: View, Navigatable {
    public enum Destination: RouteDestination {
        case view2
        case view3(fromView: String)
    }

    @EnvironmentObject public var router: Router

    public init() {}

    public var body: some View {
        navigatableView {
            VStack {
                Text("View1")
                Button("to View2") {
                    router.navigate(to: Destination.view2)
                }
                Button("to View3") {
                    router.navigate(to: Destination.view3(fromView: "View1"))
                }
            }
            .navigationTitle("View1")
        }
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
