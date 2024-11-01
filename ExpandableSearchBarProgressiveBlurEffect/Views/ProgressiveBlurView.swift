//
//  SwiftUIView.swift
//  ExpandableSearchBarProgressiveBlurEffect
//
//  Created by Abbas on 16/08/2024.
//

import SwiftUI

struct ProgressiveBlurView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> CustomBlurView {
        let view = CustomBlurView()
        view.backgroundColor = .clear
        return view
    }
    
    func updateUIView(_ uiView: CustomBlurView, context: Context) {
        // Update the view if needed
    }
}

class CustomBlurView: UIVisualEffectView {
    
    init() {
        super.init(effect: UIBlurEffect(style: .systemUltraThinMaterial))
        removeFilter()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Remove all filters and retain only the blur effect
    private func removeFilter() {
        if let filterLayer = layer.sublayers?.first {
            filterLayer.filters = []
        }
    }
    
    // This method gets called automatically when the trait collection changes (e.g., dark mode)
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        // Check for any specific trait changes if needed
        if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            DispatchQueue.main.async {
                self.removeFilter()
            }
        }
    }
}


 
