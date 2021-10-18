//
//  ParallaxMotionModifier.swift
//  TestMyMind
//
//  Created by JayR Atamosa on 10/18/21.
//

import SwiftUI
import CoreMotion

struct ParallaxMotionModifier: ViewModifier {
    
    var magnitude: Double
    
    @ObservedObject private var motion: MotionManager = MotionManager()
    
    func body(content: Content) -> some View {
        content
            .offset(x: CGFloat(motion.roll * magnitude), y: CGFloat(motion.pitch * magnitude))
    }
    
    class MotionManager: ObservableObject {

        @Published var pitch: Double = 0.0
        @Published var roll: Double = 0.0
        
        private var motionManager: CMMotionManager

        init() {
            self.motionManager = CMMotionManager()
            self.motionManager.deviceMotionUpdateInterval = 1/60
            self.motionManager.startDeviceMotionUpdates(to: .main) { (motionData, error) in
                guard error == nil else {
                    print(error!)
                    return
                }

                if let motionData = motionData {
                    self.pitch = motionData.attitude.pitch
                    self.roll = motionData.attitude.roll
                }
            }

        }
    }
    
}
