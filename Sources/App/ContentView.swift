import SwiftUI
import Router

public struct ContentView: View, Navigatable {
    public enum Destination: RouteDestination {
        case view1
        case view3(fromView: String)
    }

    @EnvironmentObject private var router: Router

    public init() {}

    public var body: some View {
        navigatableView {
            List {
                NavigationLink("to View1", value: Destination.view1)
                NavigationLink("to View3", value: Destination.view3(fromView: "ContentView"))
            }
            .navigationTitle("ContentView")
        }
    }
}

#Preview {
    RootView(
        viewProvider: { _ in
            Text("Preview")
        },
        content: {
            ContentView()
        }
    )
}
