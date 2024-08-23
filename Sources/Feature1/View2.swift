import SwiftUI
import Router

public struct View2: View {
    @EnvironmentObject private var router: Router
    public init() {}

    public var body: some View {
        VStack {
            Text("View2")
            Button("Back to Root") {
                router.backToRoot()
            }
        }
        .navigationTitle("View2")
    }
}
