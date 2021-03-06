//
//  ActionButton.swift
//  SwiftUISample
//
//  Created by akiho on 2020/11/29.
//

import SwiftUI

enum ActionButtonColor {
    case primary
    case caution

    var color: Color {
        switch self {
        case .primary:
            return Color.blue
        case .caution:
            return Color.red
        }
    }
}

struct ActionButton: View {
    let text: String
    let background: ActionButtonColor
    let action: () -> Void

    init(text: String, background: ActionButtonColor, action: @escaping () -> Void) {
        self.text = text
        self.background = background
        self.action = action
    }

    var body: some View {
        Button(action: {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            action()
        }) {
            HStack {
                Spacer()
                Text(text)
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                Spacer()
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .background(background.color)
        .cornerRadius(4.0)
    }
}

struct ActionButton_Previews: PreviewProvider {
    static var previews: some View {
        ActionButton(text: "アクション", background: .primary) {}.frame(width: 320)
    }
}
