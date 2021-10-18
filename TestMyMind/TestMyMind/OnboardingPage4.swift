//
//  OnboardingPage4.swift
//  TestMyMind
//
//  Created by JayR Atamosa on 10/18/21.
//

import SwiftUI

struct OnboardingPage4: View {
    @State var screenHeight = 0.0
    @State var screenWidth = 0.0
    @State private var animate = 0.0
    @State private var opacity = 0.0
    var body: some View {
        ZStack(alignment: .bottom) {
            Image("bg4")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .padding(EdgeInsets(top: 5, leading: 15, bottom: 0, trailing: 15))
            VStack {
                Image("logo")
                    .edgesIgnoringSafeArea(.all)
                    .padding(EdgeInsets(top:32, leading: 0, bottom: 30, trailing: 0))
                
                VStack {
                    ZStack {
                        Image("chair")
                            .resizable()
                            .offset(x: 0, y: animate == 1.0 ? 0 : 500)
                            .padding(EdgeInsets(top:40, leading: 50, bottom: 20, trailing: 50))
                            .animation(.easeIn(duration: 1.0))
                            .onAppear(perform: delayTask)
                        Image("blue")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .offset(x: -60, y: -100)
                            .transition(.scale)
                            .animation(.easeInOut(duration: 0.5))
                            .opacity(opacity)
                        Image("red")
                            .resizable()
                            .frame(width: 58, height: 50)
                            .offset(x: -35, y: 110
                            )
                            .animation(.easeInOut(duration: 0.5))
                            .opacity(opacity)
                        Image("white")
                            .resizable()
                            .frame(width: 60, height: 40)
                            .padding(EdgeInsets(top:70, leading: 60, bottom: 0, trailing: 60))
                            .offset(x: 70, y: -125)
                            .animation(.easeInOut(duration: 0.5))
                            .opacity(opacity)
                    }
                }
                Text("Just save it.     Artificial intelligence takes care of the rest.")
                    .tracking(-2)
                    .padding(EdgeInsets(top: 0, leading: 70, bottom: 0, trailing: 70))
                    .multilineTextAlignment(.center)
                    .font(.custom("Louize", size: 32))
                    .opacity(1)
                Text("Everything you saved is analyzed and tagged for you automatically.")
                    .tracking(-1)
                    .foregroundColor(Color(red: 0.38, green: 0.42, blue: 0.48, opacity: 0.65))
                    .padding(EdgeInsets(top: -30, leading: 70, bottom: 20, trailing: 70))
                    .multilineTextAlignment(.center)
                    .font(.custom("Nunito", size: 17))
                    .opacity(1)
                    .frame(height: 80)
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
                        NavigationLink(destination: OnboardingPage5()
                                        .navigationBarTitle("")
                                        .navigationBarHidden(true)) {
                            Image("continue")
                        }
                    }
                    .padding(.trailing, 30)
                    .edgesIgnoringSafeArea(.all)
                }
                .frame(height: 60)
            }
        }.onAppear {
                self.animate = 1.0
        }
        
    }
    
    private func delayTask()  {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation {
                opacity = 1.0
            }
        }
    }
}


struct OnboardingPage4_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPage4()
    }
}
