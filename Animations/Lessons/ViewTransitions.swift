//
//  ViewTransitions.swift
//  Animations
//
//  Created by Brandon Coston on 3/3/23.
//

import SwiftUI

struct ViewTransitions: View {
    @State private var isShowingRed = false
    
    var body: some View {
        VStack {
            Spacer()
            
            Button("Tap Me") {
                withAnimation {
                    isShowingRed.toggle()
                }
            }
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
            
            Spacer()
            
            Text("Toggle the state change for showing and hiding the view by explicitly animationg it using withAnimation()\n\nThen we can adjust how the view appears or disappears by using the transition() modifier on the view")
                .padding()
        }
    }
}

struct ViewTransitions_Previews: PreviewProvider {
    static var previews: some View {
        ViewTransitions()
    }
}
