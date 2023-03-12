//
//  ImplicitAnimations.swift
//  Animations
//
//  Created by Brandon Coston on 3/2/23.
//

import SwiftUI

struct ImplicitAnimations: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        VStack{
            Spacer()
            
            Button("Tap Me") {
                animationAmount += 1
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
            .blur(radius: (animationAmount - 1) * 3)
            .animation(.default, value: animationAmount)
            
            Spacer()
            
            Text("The point is that nowhere have we said what each frame of the animation should look like, and we haven’t even said when SwiftUI should start and finish the animation. Instead, our animation becomes a function of our state just like the views themselves.")
                .padding()
            
        }
    }
}

struct ImplicitAnimations_Previews: PreviewProvider {
    static var previews: some View {
        ImplicitAnimations()
    }
}
