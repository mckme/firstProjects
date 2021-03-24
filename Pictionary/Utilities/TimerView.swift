//
//  TimerView.swift
//  Pictionary
//

import Foundation
import UIKit
import Lottie

public class TimerView: UIView {
    private let animationView: AnimationView = AnimationView()
    
    private var totalTime: Int = 10
    private let totalProgress: Int = 450
    
    private var speed: CGFloat {
        return CGFloat(Float(totalProgress) / Float(totalTime)) / 30
    }
    
    public convenience init(time: Int) {
       self.init(frame: .zero)
       self.totalTime = time
       animationView.animationSpeed = self.speed
//       updateTime() // this function is coming in next lines
    }
    
    public override init(frame: CGRect) {
       super.init(frame: frame)
       let animation: Animation = Animation.named("timer")!
       animationView.animation = animation
       animationView.animationSpeed = self.speed
//       timerIndicator.textAlignment = .center
//       timerIndicator.text = "0:00:00".uppercased()
//       timerIndicator.font = UIFont.boldSystemFont(ofSize: 15)
       self.addSubview(animationView)
//       self.addSubview(timerIndicator)
    }
    
    public required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    public override func layoutSubviews() {
       super.layoutSubviews()
       animationView.frame = self.bounds
    }
    
    public func start() {
        print ("animation started")
        self.animationView.stop()
        self.animationView.play(fromProgress: 0, toProgress: 450, loopMode: .playOnce) { (isFinished) in
            print("Animation finished")
        }
    }
    
    public func stop() {
        self.animationView.stop()
    }
}
