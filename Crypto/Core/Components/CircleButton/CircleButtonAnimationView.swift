//
//  CircleButtonAnimationView.swift
//  Crypto
//
//  Created by ebrar seda gündüz on 5.12.2025.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    @Binding var animate:Bool
    var body: some View {
       Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ? Animation.easeOut(duration: 1.0): .none)
            .onAppear {
                animate.toggle()
            }
    }
}

#Preview {
    CircleButtonAnimationView(animate: .constant(false))
        .foregroundStyle(Color.red)
        .frame(width: 100,height: 100)
}
