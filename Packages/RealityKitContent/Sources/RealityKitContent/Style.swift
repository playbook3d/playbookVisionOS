//
//  Style.swift
//
//
//  Created by Alex Carrizosa on 22/08/23.
//

import SwiftUI

public struct PurpleBackground: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .background(.purple.opacity(0.2))
            .glassBackgroundEffect(in: .rect(cornerRadius: 25))
    }
}

public struct WhiteBackground: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .background(.white.opacity(0.5))
            .foregroundStyle(.black)
            .glassBackgroundEffect(in: .rect(cornerRadius: 25))
    }
}

public struct TitleStyle: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .font(.system(size: 40, weight: .semibold))
    }
}

public extension View {
    func purpleBackground() -> some View {
        modifier(PurpleBackground())
    }
    
    func whiteBackground() -> some View {
        modifier(WhiteBackground())
    }
    
    func titleStyle() -> some View {
        modifier(TitleStyle())
    }
}

#Preview {
    Text("Hello There")
        .titleStyle()
        .padding()
        .whiteBackground()
}

