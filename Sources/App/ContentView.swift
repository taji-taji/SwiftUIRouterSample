import SwiftUI
import Router

public struct ContentView: View {
    public enum Destination: RouteDestination {
        case view1
        case view3(fromView: String)
    }

    @EnvironmentObject private var router: Router

    public init() {}

    public var body: some View {
        List {
            NavigationLink("to View1", value: Destination.view1)
            NavigationLink("to View3", value: Destination.view3(fromView: "ContentView"))
        }
        .navigationDestination(for: Destination.self) { destination in
            router.view(for: destination)
        }
        .navigationTitle("ContentView")
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
