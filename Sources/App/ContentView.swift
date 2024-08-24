import SwiftUI
import Router

@Navigatable
public struct ContentView: View {
    public enum Destination: RouteDestination {
        case view1
        case view3(fromView: String)
    }

    public init() {}

    public var body: some View {
        List {
            NavigationLink("to View1", value: Destination.view1)
            NavigationLink("to View3", value: Destination.view3(fromView: "ContentView"))
        }
        .navigationTitle("ContentView")
        .navigatable(for: Destination.self)
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
