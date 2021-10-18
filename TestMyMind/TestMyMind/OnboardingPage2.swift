//
//  OnboardingPage2.swift
//  TestMyMind
//
//  Created by JayR Atamosa on 10/18/21.
//

import SwiftUI

struct OnboardingPage2: View {
    @State var willMoveToNextScreen: Bool = false
    @State private var counter = 6
    @State var feature1: Double = 0
    @State var feature2: Double = 0
    @State var feature3: Double = 0
    @State var feature4: Double = 0
    @State var feature5: Double = 0
    @State var feature6: Double = 0
    let timer = Timer.publish(every: 0.3, on: .main, in: .common).autoconnect()
    var body: some View {
        
        ZStack {
            Image("bg2")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .padding(EdgeInsets(top: 5, leading: 15, bottom: 0, trailing: 15))
            VStack {
                VStack {
                    Image("logo")
                        .edgesIgnoringSafeArea(.all)
                        .padding(EdgeInsets(top:32, leading: 0, bottom: 0, trailing: 0))
                }
                Spacer()
                VStack {
                    Text("You're reclaiming what belongs to you. Your mind is private, for you and only you.")
                        .tracking(-2)
                        .padding(EdgeInsets(top: 0, leading: 30, bottom: 40, trailing: 30))
                        .multilineTextAlignment(.center)
                        .font(.custom("Louize", size: 32))
                        .opacity(1)
                       
                    Text("\u{2022} No social features")
                        .foregroundColor(Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.65))
                        .animation(.easeInOut(duration:0.3))
                        .frame(maxWidth: .infinity)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 1, trailing: 0))
                        .font(.custom("Nunito", size: 17))
                        .multilineTextAlignment(.leading)
                        .opacity(feature1)
                    Text("\u{2022} No collaboration")
                        .foregroundColor(Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.65))
                        .animation(.easeInOut(duration:0.3))
                        .padding(EdgeInsets(top: 0, leading: -12, bottom: 1, trailing: 0))
                        .font(.custom("Nunito", size: 17))
                        .multilineTextAlignment(.leading)
                        .opacity(feature2)
                    Text("\u{2022} No vanity metrics")
                        .foregroundColor(Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.65))
                        .animation(.easeInOut(duration:0.3))
                        .padding(EdgeInsets(top: 0, leading: -4, bottom: 1, trailing: 0))
                        .font(.custom("Nunito", size: 17))
                        .multilineTextAlignment(.leading)
                        .opacity(feature3)
                    Text("\u{2022} No social pressure")
                        .foregroundColor(Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.65))
                        .animation(.easeInOut(duration:0.3))
                        .padding(EdgeInsets(top: 0, leading: 8, bottom: 1, trailing: 0))
                        .font(.custom("Nunito", size: 17))
                        .multilineTextAlignment(.leading)
                        .opacity(feature4)
                    Text("\u{2022} No tracking")
                        .foregroundColor(Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.65))
                        .animation(.easeInOut(duration:0.3))
                        .padding(EdgeInsets(top: 0, leading: -46, bottom: 1, trailing: 0))
                        .font(.custom("Nunito", size: 17))
                        .multilineTextAlignment(.leading)
                        .opacity(feature5)
                    Text("\u{2022} No ads")
                        .foregroundColor(Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.65))
                        .animation(.easeInOut(duration:0.3))
                        .padding(EdgeInsets(top: 0, leading: -80, bottom: 1, trailing: 0))
                        .font(.custom("Nunito", size: 17))
                        .multilineTextAlignment(.leading)
                        .opacity(feature6)
                        .onReceive(timer) { time in
                            print("counter : \(counter)")
                            if counter > 0 {
                                withAnimation(.easeInOut(duration: 0.0), {
                                    switch counter {
                                        case 6:
                                            feature1 = 1
                                            feature2 = 0
                                        case 5:
                                            feature2 = 1
                                            feature3 = 0
                                        case 4:
                                            feature3 = 1
                                        case 3:
                                            feature4 = 1
                                        case 2:
                                            feature5 = 1
                                        case 1:
                                            feature6 = 1
                                        default:
                                            feature6 = 1
                                    }
                                })
                                counter = counter - 1
                            } else {
                                self.timer.upstream.connect().cancel()
                            }
                        }
                    Button {
                        willMoveToNextScreen = true
                    } label: {
                        Image("btn2")
                        
                    }
                    .padding(.leading, 20)
                }
                Spacer()
            }
        }.onAppear {
            //self.startTimer()
        }
        .onDisappear(perform: {
            self.timer.upstream.connect().cancel()
        })
        .navigate(to: OnboardingPage3(), when: $willMoveToNextScreen)
    }
    
    func startTimer() {
        _ = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { timer in
            print("counter : \(counter)")
            if counter > 0 {
                withAnimation(.easeInOut(duration: 1.0), {
                    switch counter {
                        case 6:
                            feature1 = 1
                            feature2 = 0
                        case 5:
                            feature2 = 1
                            feature3 = 0
                        case 4:
                            feature3 = 1
                        case 3:
                            feature4 = 1
                        case 2:
                            feature5 = 1
                        case 1:
                            feature6 = 1
                        default:
                            feature6 = 1
                    }
                })
                counter = counter - 1
            } else {
                timer.invalidate()
            }
        }
    }
}

struct OnboardingPage2_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPage2()
    }
}
