//
//  UISlider.swift
//  CheckValueGame
//
//  Created by Ярослав Бойко on 07.12.2021.
//

import SwiftUI

struct CustomSlider: UIViewRepresentable {
    
    @Binding var sliderValue: Double
    
    let alpha: Int
    let color: UIColor
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.addTarget(context.coordinator,
                         action: #selector(Coordinator.valueChanged),
                         for: .valueChanged)
        
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.thumbTintColor = color.withAlphaComponent(CGFloat(alpha) / 100)
        uiView.value = Float(sliderValue)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $sliderValue)
    }
}

extension CustomSlider {
    class Coordinator: NSObject {
        @Binding var sliderValue: Double
        
        init(value: Binding<Double>) {
            self._sliderValue = value
        }
        
        @objc func valueChanged(sender: UISlider) {
            sliderValue = Double(sender.value)
        }
    }
}

struct CustomSlider_Previews: PreviewProvider {
    static var previews: some View {
        CustomSlider(sliderValue: .constant(50), alpha: 30, color: .red)
    }
}
