import SwiftUI
import App
import Router

@main
struct RouterSampleApp: App {
    var body: some Scene {
        WindowGroup {
            RootView(viewProvider: viewProvider) {
                ContentView()
            }
        }
    }
}
