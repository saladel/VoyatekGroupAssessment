//
//  ToastView.swift
//  GoPaddi
//
//  Created by Adewale Sanusi on 20/10/2024.
//

import SwiftUI

struct ToastView: View {
    @Environment(\.dismiss) var dismiss
    
    let toast: Toast
    let dismissAction: () -> Void
    
    @State private var isVisible = false
    @State private var timeRemaining: TimeInterval = 0
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: toast.type.icon)
                .foregroundColor(.white)
            
            Text(toast.message)
                .font(.subheadline)
                .foregroundColor(.white)
            
            Spacer()
            
            Button(action: dismissAction) {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(toast.type.backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .shadow(radius: 4)
        .padding(.horizontal, 16)
        .scaleEffect(isVisible ? 1 : 0.9)
        .opacity(isVisible ? 1 : 0)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(toast.message)
        .accessibilityHint("Toast notification")
        .onAppear {
            isVisible = true
            timeRemaining = toast.duration
            Timer.scheduledTimer(withTimeInterval: toast.duration, repeats: false) { _ in
                dismissAction()
            }
        }
        .animation(.easeInOut(duration: 0.3), value: isVisible)
    }
}

struct ToastView_Previews: PreviewProvider {
    static var previews: some View {
        ToastView(
            toast: Toast(message: "Please fill in all required fields", type: .error, duration: 3), dismissAction: {}
        )
        
        ToastView(
            toast: Toast(message: "Trip created successfully!", type: .success, duration: 3), dismissAction: {}
        )
    }
}
