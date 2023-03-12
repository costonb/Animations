//
//  CustomizingAnimations.swift
//  Animations
//
//  Created by Brandon Coston on 3/2/23.
//

import SwiftUI

struct CustomizingAnimations: View {
    @State private var animationSpring = 1.0
    @State private var animationOverlay = 1.0
    
    var body: some View {
        VStack(spacing: 20){
            CustomizingAnimations_RepeatCount()
            CustomizingAnimations_Spring()
            CustomizingAnimations_RepeatForever()
            
        }
    }
}

struct CustomizingAnimations_Previews: PreviewProvider {
    static var previews: some View {
        CustomizingAnimations()
    }
}

struct CustomizingAnimations_RepeatCount: View {
    @State private var animationEaseOut = 1.0
    
    var body: some View {
        Button("EaseOut") {
            animationEaseOut += 1
        }
        .padding(50)
        .background(.blue)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(animationEaseOut)
        .animation(
            .easeOut(duration: 2)
                .delay(1)
                .repeatCount(3, autoreverses: true),
            value: animationEaseOut
        )
    }
}

struct CustomizingAnimations_Spring: View {
    @State private var animationSpring = 1.0
    
    var body: some View {
        Button("Spring") {
            animationSpring += 1
        }
        .padding(50)
        .background(.green)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(animationSpring)
        .animation(.interpolatingSpring(stiffness: 50, damping: 1), value: animationSpring)
    }
}

struct CustomizingAnimations_RepeatForever: View {
    @State private var animationOverlay = 1.0
    
    var body: some View {
        Button("Overlay") {
            
        }
        .padding(50)
        .background(.purple)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(.purple)
                .scaleEffect(animationOverlay)
                .opacity(2 - animationOverlay)
                .animation(
                    .easeOut(duration: 1)
                    .repeatForever(autoreverses: false),
                    value: animationOverlay
                )
        )
        .onAppear {
            animationOverlay = 2
        }
    }
}
