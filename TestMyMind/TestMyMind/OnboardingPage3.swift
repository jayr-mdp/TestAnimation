//
//  OnboardingPage3.swift
//  TestMyMind
//
//  Created by JayR Atamosa on 10/18/21.
//

import SwiftUI

struct OnboardingPage3: View {
    @State var screenHeight = 0.0
    @State var screenWidth = 0.0
    @State private var animate = false
    var body: some View {
        ZStack(alignment: .bottom) {
            Image("bg3")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .padding(EdgeInsets(top: 5, leading: 15, bottom: 0, trailing: 15))
            VStack {
                Image("logo")
                    .edgesIgnoringSafeArea(.all)
                    .padding(EdgeInsets(top:32, leading: 0, bottom: 30, trailing: 0))
                Text("It's a private place for everything you care about, enhanced with artificial intelligence.")
                    .tracking(-2)
                    .padding(EdgeInsets(top: 0, leading: 30, bottom: 20, trailing: 30))
                    .multilineTextAlignment(.center)
                    .font(.custom("Louize", size: 32))
                    .opacity(1)
                VStack {
                    Image("phone")
                        .resizable()
                        .padding(EdgeInsets(top:0, leading: 30, bottom: 0, trailing: 30))
                        .offset(x: 0, y: animate ? 0 : 500)
                        .animation(.easeIn(duration: 1.0))
                }
            }
            Image("mask")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .padding(EdgeInsets(top:0, leading: 0, bottom: 0, trailing: 0))
                .frame(height: 150)
                .offset(y: 50)
            HStack(alignment: .center) {
                Button {
                } label: {
                    NavigationLink(destination: MainPage()
                                    .navigationBarTitle("")
                                    .navigationBarHidden(true)) {
                        Text("SKIP")
                            .font(.custom("Nunito", size: 15))
                            .foregroundColor(Color(red: 0.46, green: 0.51, blue: 0.59, opacity: 0.65))
                    }
                }
                .padding(.leading, 45)
                Spacer()
                Button {
                } label: {
                    NavigationLink(destination: OnboardingPage4()
                                    .navigationBarTitle("")
                                    .navigationBarHidden(true)) {
                        Image("continue")
                    }
                }
                .padding(.trailing, 30)
                .edgesIgnoringSafeArea(.all)
            }
            .frame(height: 60)
        }.onAppear {
            self.animate = true
        }
        
    }
}

struct OnboardingPage3_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OnboardingPage3()
        }
    }
}
