import SwiftUI
import Router

@Navigatable
public struct View2: View {
    public struct Destination: RouteDestination {}
    public init() {}

    public var body: some View {
        VStack {
            Text("View2")
            Button("Back to Root") {
                navigateBackToRoot()
            }
        }
        .navigationTitle("View2")
    }
}
