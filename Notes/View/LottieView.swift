//
//  LottieView.swift
//  Notes
//
//  Created by Consultant on 8/1/23.
//

import Foundation
import Lottie
import SwiftUI

struct LottieView: UIViewRepresentable{
    let name: String
    let loopMode: LottieLoopMode
    let animationSpeed: CGFloat
    
    func makeUIView(context: Context) -> some UIView {
        let animationView = LottieAnimationView(name: name)
        animationView.loopMode = loopMode
        animationView.animationSpeed = animationSpeed
        animationView.play()
        return animationView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    
}
