import SwiftUI

enum MyNotesFlow: NavigationDestination {
    case profile
    
    var title: String {
        switch(self) {
            case .profile:
            return "Profile"
        }
    }
    
    var destinationView: some View {
        switch(self) {
            case .profile: ProfileView()
        }
    }
}

typealias MyNotesFlowRouter = Router<MyNotesFlow>
