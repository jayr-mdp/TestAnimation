//
//  OnboardingPage5.swift
//  TestMyMind
//
//  Created by JayR Atamosa on 10/18/21.
//

import SwiftUI

struct OnboardingPage5: View {
    @State var searchString: String = ""
    @State var screenHeight = 0.0
    @State var screenWidth = 0.0
    @State private var animate = 0.0
    @State private var animate2 = 0.0
    @State private var opacity = 0.0
    var body: some View {
        ZStack(alignment: .bottom) {
            Image("bg5")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .padding(EdgeInsets(top: 5, leading: 15, bottom: 0, trailing: 15))
            VStack {
                Image("logo")
                    .edgesIgnoringSafeArea(.all)
                    .padding(EdgeInsets(top:32, leading: 0, bottom: 30, trailing: 0))
                
                VStack {
                    ZStack {
                        Image("car")
                            .resizable()
                            .frame(width: 193, height: 238)
                            .offset(x: 0, y: animate == 1.0 ? 0 : 500)
                            .padding(EdgeInsets(top:40, leading: 50, bottom: 20, trailing: 50))
                            .animation(.easeIn(duration: 1.0))
                            .modifier(ParallaxMotionModifier(magnitude: 50))
                            .onAppear(perform: delayTask)
                        Image("room")
                            .resizable()
                            .frame(width: 135, height: 90)
                            .offset(x: animate2 == 1.0 ? 70 : 400, y: 130)
                            .transition(.scale)
                            .modifier(ParallaxMotionModifier(magnitude: 60))
                            .animation(.easeInOut(duration: animate2 == 1.0 ? 3.0 : 0.2))
                        Image("watch")
                            .resizable()
                            .frame(width: 180, height: 250)
                            .offset(x:  animate2 == 1.0 ? -90 : -400, y: 45)
                            .modifier(ParallaxMotionModifier(magnitude: 40))
                            .animation(.easeInOut(duration: animate2 == 1.0 ? 2.0 : 0.2))
                        
                        Image("textBG")
                            .resizable()
                            .frame(width: 171, height: 28)
                            .offset(x:  50 , y: -110)
                            .animation(.easeInOut(duration: 0.5))
                            .opacity(opacity)
                        Image("textImage")
                            .resizable()
                            .frame(width: 14, height: 14)
                            .offset(x:  -10 , y: -110)
                            .animation(.easeInOut(duration: 0.5))
                            .opacity(opacity)
                        TextField("Show blue images", text: $searchString)
                            .foregroundColor(Color.orange)
                            .font(.custom("Nunito", size: 15))
                            .frame(width: 130, height: 28)
                            .offset(x:  65 , y: -110)
                            .animation(.easeInOut(duration: 0.5))
                            .opacity(opacity)
                    }
                }
                .padding(EdgeInsets(top:0, leading: 0, bottom: 60, trailing: 0))
                Text("No folders, no collections, no wasted time organizing.")
                    .tracking(-2)
                    //.padding(EdgeInsets(top: 20, leading: 70, bottom: 50, trailing: 70))
                    .multilineTextAlignment(.center)
                    .font(.custom("Louize", size: 32))
                    .opacity(1)
                    .frame(width: 250 , height: 120)
                Text("It works like your real mind. One stream of conciousness. To find something, just search for it.")
                    .tracking(-1)
                    .foregroundColor(Color(red: 0.38, green: 0.42, blue: 0.48, opacity: 0.65))
                    .padding(EdgeInsets(top: -10, leading: 70, bottom: 0, trailing: 70))
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
                        NavigationLink(destination: OnboardingPage6()
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
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation {
                animate2 = 1.0
                opacity = 1.0
            }
        }
    }
}

struct OnboardingPage5_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPage5()
    }
}

