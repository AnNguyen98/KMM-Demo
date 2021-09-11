import SwiftUI

@main
struct iOSApp: App {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    
	var body: some Scene {
		WindowGroup {
            if isLoggedIn {
                HomeView()
            } else {
                LoginView()
            }
		}
	}
}
