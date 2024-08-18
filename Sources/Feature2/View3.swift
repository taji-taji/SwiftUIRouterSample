import SwiftUI
import Router

public struct View3: View {
    public enum Destination: RouteDestination {
        case view4
    }

    @EnvironmentObject private var router: Router
    @State private var isPresented = false
    private let fromView: String

    public init(fromView: String) {
        self.fromView = fromView
    }

    public var body: some View {
        VStack {
            Text("View3 (from: \(fromView))")
            Button("to View4") {
                isPresented = true
            }
            Button("Back") {
                router.pop()
            }
        }
        .sheet(isPresented: $isPresented) {
            RootView(viewProvider: router.viewProvider) {
                router.view(for: Destination.view4)
            }
        }
        .navigationTitle("View3")
    }
}
