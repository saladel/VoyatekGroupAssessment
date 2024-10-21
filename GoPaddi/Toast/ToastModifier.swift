//
//  ToastModifier.swift
//  GoPaddi
//
//  Created by Adewale Sanusi on 15/10/2024.
//

import SwiftUI

/// A view modifier for presenting toast notifications.
struct ToastModifier: ViewModifier {
    @Binding var toast: Toast?
    @State private var workItem: DispatchWorkItem?
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(
                ZStack {
                    toastOverlay()
                        .offset(y: 32)
                }
                .animation(.easeInOut, value: toast)
            )
            .onChange(of: toast) { value in
                showToast()
            }
    }
    
    // Toast presentation
    @ViewBuilder
    func toastOverlay() -> some View {
        if let toast = toast {
            VStack {
                ToastView(toast: toast, dismissAction: dismissToast)
            }
        }
    }
    
    // Toast management
    private func showToast() {
        guard let toast = toast else { return }
        
        UIImpactFeedbackGenerator(style: .light)
            .impactOccurred()
        
        if toast.duration > 0 {
            workItem?.cancel()
            
            let task = DispatchWorkItem {
                dismissToast()
            }
            
            workItem = task
            DispatchQueue.main.asyncAfter(deadline: .now() + toast.duration, execute: task)
        }
    }
    
    private func dismissToast() {
        withAnimation {
            toast = nil
        }
        
        workItem?.cancel()
        workItem = nil
    }
}

extension View {
    /// Presents a toast notification using the provided binding.
    func toastView(toast: Binding<Toast?>) -> some View {
        self.modifier(ToastModifier(toast: toast))
    }
}
