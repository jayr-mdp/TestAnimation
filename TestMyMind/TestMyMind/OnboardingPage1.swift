//
//  OnboardingPage1.swift
//  TestMyMind
//
//  Created by JayR Atamosa on 10/18/21.
//

import SwiftUI

struct OnboardingPage1: View {
    @State var text: String = ""
    @State var willMoveToNextScreen: Bool = false
    var body: some View {
        ZStack {
                Image("bg1")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            VStack {
                Image("logo")
                    .edgesIgnoringSafeArea(.all)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 40, trailing: 0))
                Text(text)
                    .tracking(-3)
                    .animation(.easeInOut(duration:0.3))
                    .font(.custom("Louize", size: 60))
                    .padding(EdgeInsets(top: 0, leading: 30, bottom: 40, trailing: 30))
                    .multilineTextAlignment(.center)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            withAnimation {
                                text = "What was once lost, is now yours again."
                            }
                        }
                    }
                Button {
                    willMoveToNextScreen = true
                    
                } label: {
                    Image("takeBackbtn")
                }
            }
        }
        .navigate(to: OnboardingPage2(), when: $willMoveToNextScreen)
    }
}

extension View {
    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
        NavigationView {
            ZStack {
                self
                    .navigationBarTitle("")
                    .navigationBarHidden(true)

                NavigationLink(
                    destination: view
                        .navigationBarTitle("")
                        .navigationBarHidden(true),
                    isActive: binding
                ) {
                    EmptyView()
                }
            }
        }
    }
}

struct OnboardingPage1_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPage1()
    }
}
