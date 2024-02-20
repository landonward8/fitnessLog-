import SwiftUI
@main
struct FitnessLog_App: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarTitle("Fitness Journal", displayMode: .large)
            }
        }
    }
}



