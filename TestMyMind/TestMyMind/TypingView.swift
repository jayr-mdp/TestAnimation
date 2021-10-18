//
//  TypingView.swift
//  TestMyMind
//
//  Created by JayR Atamosa on 10/18/21.
//

import SwiftUI

struct TypingView: View {
    @State var animatedText = ""
    @State var animatedText2 = ""
    @State var animatedText3 = ""
    @State var animate = 0.0
    @State var opacity = 0.0
    @State private var highlightOneWidth = 0.0
    @State private var highlightTwoWidth = 0.0
    @State private var highlightThreeWidth = 0.0
    @State private var cursorOneX = 15.0
    @State private var cursorTwoX = 0.0
    @State private var cursorThreeX = 0.0
    @State private var highlightOneOpacity = 0.0
    @State private var highlightTwoOpacity = 0.0
    @State private var highlightThreeOpacity = 0.0
    @State private var cursorOneOpacity = 0.0
    @State private var cursorTwoOpacity = 0.0
    @State private var cursorThreeOpacity = 0.0
    
    var highlightOnePositions = [18.0, 28.0, 36.0, 46.0, 56.0, 64.0, 74.0, 84.0, 94.0, 102.0, 112.0,122.0,132.0,142.0,152.0,162.0,172.0,182.0]
    var highlightTwoPositions = [15.0,25.0,35.0,40.0,50.0,60.0,70.0,80.0,88.0,93.0,103.0,111.0,121.0,131.0, 145.0,155.0,165.0,174.0,188.0,198.0,208.0]
    var highlightThreePositions = [15.0,25.0,35.0,45.0,53.0,63.0,83.0,90.0,98.0,114.0,124.0,134.0,139.0,158.0,168.0]
    var cursorOnePositions = [15.0, 25.0, 33.0, 43.0, 53.0, 61.0, 71.0, 81.0, 91.0, 99.0, 109.0,119.0,129.0,139.0, 149.0,159.0,169.0,179.0]
    var cursorTwoPositions = [10.0,20.0,30.0,35.0,45.0,55.0,65.0,75.0,83.0,88.0,98.0,108.0,118.0,128.0, 140.0,150.0,160.0,169.0,183.0,193.0, 203.0]
    var cursorThreePositions = [10.0,20.0,30.0,40.0,48.0,58.0,78.0,85.0,93.0,109.0,119.0,129.0,134.0,153.0,163.0]
    
    var body: some View {
        ZStack (alignment: .leading) {
            Image("up")
                .resizable()
                .frame(width: 12 , height: 38)
                .offset(x: -56, y: -38)
                .padding(EdgeInsets(top:40, leading: 50, bottom: 20, trailing: 50))
                .animation(.easeIn(duration: 1.0))
            
            
            ZStack(alignment: .leading) {
                ZStack(alignment: .leading) {
                    Rectangle()
                    .fill(Color(red: 1.0, green: 0.83, blue: 0.78, opacity: 1.0))
                    .frame(width: highlightOneWidth  , height: 30)
                    .offset(x: 0, y: 0)
                    
                    Text(animatedText)
                        .font(.custom("Louize", size: 24))
                        .multilineTextAlignment(.leading)
                        .opacity(1)
                        .frame(width: 208 , height: 30, alignment: .leading)
                        .offset(x: 0, y: 0)
                    Image("down")
                        .resizable()
                        .offset(x: cursorOneX, y: 6)
                        .frame(width: 10 , height: 38, alignment: .leading)
                        //.animation(.easeIn(duration: 1.0))
                        .opacity(cursorOneOpacity)
                    
                }
                .frame(width: 208 , height: 28)
                .offset(x: 0, y: -15)
                
                ZStack(alignment: .leading) {
                    Rectangle()
                    .fill(Color(red: 1.0, green: 0.83, blue: 0.78, opacity: 1.0))
                    .padding(EdgeInsets(top:0, leading: 0, bottom: 0, trailing: 0))
                    .frame(width: highlightTwoWidth , height: 30)
                    .offset(x: 0, y: 0)
                    Text(animatedText2)
                        .multilineTextAlignment(.leading)
                        .font(.custom("Louize", size: 24))
                        .opacity(1)
                        .frame(width: 208 , height: 30, alignment: .leading)
                        .offset(x: 0, y: 0)
                        
                    Image("down")
                        .resizable()
                        .frame(width: 12 , height: 38, alignment: .leading)
                        .offset(x: cursorTwoX, y: 6)
                        //.animation(.easeIn(duration: 1.0))
                        .opacity(cursorTwoOpacity)
                }
                .frame(width: 208 , height: 30)
                .offset(x: 0, y: 15)
                
                ZStack(alignment: .leading) {
                    Rectangle()
                    .fill(Color(red: 1.0, green: 0.83, blue: 0.78, opacity: 1.0))
                    .padding(EdgeInsets(top:0, leading: 0, bottom: 0, trailing: 0))
                    .frame(width: highlightThreeWidth , height: 30)
                    .offset(x: 0, y: 0)
                    Text(animatedText3)
                        .multilineTextAlignment(.leading)
                        .font(.custom("Louize", size: 23))
                        .opacity(1)
                        .frame(width: 208 , height: 30, alignment: .leading)
                        .offset(x: 0, y: 0)
                    Image("down")
                        .resizable()
                        .frame(width: 12 , height: 38, alignment: .leading)
                        .offset(x: cursorThreeX, y: 6)
                        //.animation(.easeIn(duration: 1.0))
                        .opacity(cursorThreeOpacity)
                }
                .frame(width: 208 , height: 30)
                .offset(x: 0, y: 45)
            }
            .frame(width: 208 , height: 90)
            .offset(x: 2, y: -5)
        }
        .frame(width: 200 , height: 85)
        .opacity(opacity)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation {
                    opacity = 1.0
                    typeOn(string: "To be the ultimate", index: 0)
                }
            }
        }
        
    }
    
    func typeOn(string: String, index : Int) {
        let characterArray = Array(string)
        var characterIndex = 0
        var indexLocation = 0
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (timer) in
            switch index {
            case 0:
                let location = cursorOnePositions[indexLocation]
                let width = highlightOnePositions[indexLocation]
                highlightOneWidth = width
                cursorOneX = location
                cursorOneOpacity = 1.0
                self.animatedText.append(characterArray[characterIndex])
            case 1:
                let location = cursorTwoPositions[indexLocation]
                let width = highlightTwoPositions[indexLocation]
                highlightTwoWidth = width
                cursorTwoX = location
                cursorOneOpacity = 0.0
                cursorTwoOpacity = 1.0
                self.animatedText2.append(characterArray[characterIndex])
            case 2:
                let location = cursorThreePositions[indexLocation]
                let width = highlightThreePositions[indexLocation]
                highlightThreeWidth = width
                cursorThreeX = location
                cursorTwoOpacity = 0.0
                cursorThreeOpacity = 1.0
                self.animatedText3.append(characterArray[characterIndex])
            default:
                self.animatedText.append(characterArray[characterIndex])
            }
            indexLocation += 1
            characterIndex += 1
            if characterIndex == characterArray.count {
                timer.invalidate()
                if(index == 0) {
                    indexLocation = 0
                    characterIndex = 0
                    typeOn(string: "designer is to design", index: 1)
                } else if (index == 1) {
                    indexLocation = 0
                    characterIndex = 0
                    typeOn(string: "your own world.", index: 2)
                }
            }
        }
    }
}

struct TypingView_Previews: PreviewProvider {
    static var previews: some View {
        TypingView()
    }
}
