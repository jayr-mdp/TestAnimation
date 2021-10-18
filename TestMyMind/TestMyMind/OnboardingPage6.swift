//
//  OnboardingPage6.swift
//  TestMyMind
//
//  Created by JayR Atamosa on 10/18/21.
//

import SwiftUI

struct OnboardingPage6: View {
    @State var animatedText: String = "To be the ultimate designer is to design your own world."
    @State var screenHeight = 0.0
    @State var screenWidth = 0.0
    @State private var animate = 0.0
    @State private var opacity = 0.0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image("bg6")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .padding(EdgeInsets(top: 5, leading: 15, bottom: 0, trailing: 15))
            VStack {
                Image("logo")
                    .edgesIgnoringSafeArea(.all)
                    .padding(EdgeInsets(top:32, leading: 0, bottom: 30, trailing: 0))
                
                VStack {
                    ZStack {
                        Image("flower2")
                            .resizable()
                            .frame(width: 210, height: 280)
                            .offset(x: -50, y: animate == 1.0 ? 20 : 500)
                            .padding(EdgeInsets(top:40, leading: 50, bottom: 20, trailing: 50))
                            .animation(.easeIn(duration: 1.0))
                        Image("flower1")
                            .resizable()
                            .frame(width: 210 , height: 280)
                            .offset(x: 25, y: animate == 1.0 ? 0 : 500)
                            .padding(EdgeInsets(top:40, leading: 50, bottom: 20, trailing: 50))
                            .animation(.easeIn(duration: 1.0))
                            .onAppear(perform: delayTask)
                        Button {
                        } label: {
                            Image("addBtn")
                        }
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: 66 , height: 66)
                        .offset(x: 130, y: animate == 1.0 ? 157 : 500)
                        .opacity(opacity)
                        
                        //PUT the animated view
                        TypingView()
                            .frame(width: 200 , height: 85)
                            .offset(x: -30, y: animate == 1.0 ? -130 : 500)
                            .opacity(opacity)
                    }
                }
                .padding(EdgeInsets(top:0, leading: 0, bottom: 20, trailing: 0))
                Text("Just save it to your mind.")
                    .tracking(-2)
                    .padding(EdgeInsets(top: 20, leading: 70, bottom: 0, trailing: 70))
                    .multilineTextAlignment(.center)
                    .font(.custom("Louize", size: 32))
                    .opacity(1)
                Text("Click the share optionanywhere to save it to your mind: An image, a textt highlight, a tweet - mymind will analyze and categorize it for you.")
                    .tracking(-1)
                    .foregroundColor(Color(red: 0.38, green: 0.42, blue: 0.48, opacity: 0.65))
                    .padding(EdgeInsets(top: -30, leading: 70, bottom: 20, trailing: 70))
                    .multilineTextAlignment(.center)
                    .font(.custom("Nunito", size: 17))
                    .opacity(1)
                    .frame(height: 100)
                HStack(alignment: .center) {
                    Button {
                    } label: {
                        NavigationLink(destination: MainPage()
                                        .navigationBarTitle("")
                                        .navigationBarHidden(true)) {
                            Image("btn6")
                        }
                    }
                    .padding(.trailing, -20)
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
                opacity = 1.0
            }
        }
    }
}

struct OnboardingPage6_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPage6()
    }
}
