import SwiftUI

struct CapsuleButtonStyle: ButtonStyle {
    let bgColor: Color
    let textColor: Color
    let hasBorder: Bool
    
    init(bgColor: Color = .teal, textColor: Color = .white, hasBorder: Bool = false) {
        self.bgColor = bgColor
        self.textColor = textColor
        self.hasBorder = hasBorder
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(textColor)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Capsule().fill(bgColor))
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .overlay {
                hasBorder ? Capsule().stroke(.gray, lineWidth: 1) : nil
            }
    }
}
