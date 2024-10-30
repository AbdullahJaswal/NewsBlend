//
//  TwoFingerGesture.swift
//  NewsBlend
//
//  Created by Abdullah Jaswal on 13/10/2024.
//

import SwiftUI
import UIKit

struct TwoFingerSwipeGesture: UIViewRepresentable {
    var onSwipeLeft: () -> Void
    var onSwipeRight: () -> Void

    class Coordinator: NSObject, UIGestureRecognizerDelegate {
        var onSwipeLeft: () -> Void
        var onSwipeRight: () -> Void

        init(onSwipeLeft: @escaping () -> Void, onSwipeRight: @escaping () -> Void) {
            self.onSwipeLeft = onSwipeLeft
            self.onSwipeRight = onSwipeRight
        }

        @objc func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
            if gesture.numberOfTouches == 2 {
                let translation = gesture.translation(in: gesture.view)

                if gesture.state == .changed || gesture.state == .ended {
                    if translation.x < -100 {
                        onSwipeLeft()
                    } else if translation.x > 100 {
                        onSwipeRight()
                    }
                }
            }
        }

        func gestureRecognizer(_: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith _: UIGestureRecognizer) -> Bool {
            true
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(onSwipeLeft: onSwipeLeft, onSwipeRight: onSwipeRight)
    }

    func makeUIView(context: Context) -> UIView {
        let view = UIView()

        let panGesture = UIPanGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handlePanGesture(_:)))
        panGesture.minimumNumberOfTouches = 2
        panGesture.maximumNumberOfTouches = 2
        panGesture.delegate = context.coordinator
        panGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(panGesture)

        return view
    }

    func updateUIView(_: UIView, context _: Context) {}
}
