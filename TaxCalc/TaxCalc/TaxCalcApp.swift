

import SwiftUI

@main
struct TaxCalcApp: App {
    @StateObject var taxExample = Tax()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(taxExample)
        }
    }
}
