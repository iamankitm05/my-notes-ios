import SwiftUI

enum LoginFlow: NavigationDestination {
    case signUp
    case forgetPassword
    
    var title: String {
        switch self {
        case .signUp:
            return "Sign Up"
        case .forgetPassword:
            return "Forget Password"
        }
    }
    
    var destinationView: some View {
        switch self {
        case .signUp: SignUpView()
        case .forgetPassword: ForgotPasswordView()
        }
    }
}

typealias LoginFlowRouter = Router<LoginFlow>
