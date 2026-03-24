import SwiftUI
import Combine

protocol NavigationDestination: Hashable {
    associatedtype Destination: View
    
    var title: String { get }
    
    @ViewBuilder
    var destinationView: Destination { get }
}

final class Router<Destination: NavigationDestination>: ObservableObject {
    @Published var navPaths: [Destination] = []
    
    func navigate(to destination: Destination) {
        navPaths.append(destination)
    }
    
    func back() -> Destination? {
        guard !navPaths.isEmpty else { return nil }
        return navPaths.removeLast()
    }
    
    func backToRoot() {
        navPaths.removeLast(navPaths.count)
    }
}
