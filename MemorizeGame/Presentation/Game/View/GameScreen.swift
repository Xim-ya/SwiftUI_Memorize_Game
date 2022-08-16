//
//  GameScreen.swift
//  MemorizeGame
//
//  Created by 이해주 on 2022/08/15.
//

import SwiftUI

struct GameScreen: View {
    @StateObject private var vm: GameViewModel
    
    init(emojiList: [String]) {
        _vm = StateObject(wrappedValue: GameViewModel(emojiList: emojiList))
    }
    
    private func responsiveColumns(width: CGFloat) -> [GridItem] {
        return Array(1...3).map { _ in
            return  GridItem(.adaptive(minimum: width * 0.23), spacing: 20)
       }
    }

    private let tempList:[String] = ["1" , "2" , "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]    

    var body: some View {
        GeometryReader { geometry in
            ScrollView (showsIndicators: false) {
                VStack (alignment: .center) {
                    Text("3")
                        .font(.system(.largeTitle))
                    Spacer()
                    LazyVGrid(columns: responsiveColumns(width: geometry.size.height)) {
                        ForEach(tempList, id: \.self) { emoji in
                            CardView(emoji: emoji, geometrySize: geometry.size)
                        }
                    }
                    Spacer()
                    Button {
                        print("Quite Action")
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.green)
                                .cornerRadius(30)
                                .frame(width: 176, height: 46, alignment: .center)
                            Text("Quit")
                                .foregroundColor(Color.white)
                        } 
                        .padding(.bottom, 20)
                    }                }
                .frame(minHeight: geometry.size.height)
                .padding(.horizontal, 20)
            }
            .frame(height: geometry.size.height)
        }
        .navigationBarTitleDisplayMode(.inline) // IMPORTANT IF YOU WANT REMOVE TOP INSETS
        .navigationBarItems(trailing: Text("TIME"))
    }
}

struct CardView: View {
    let emoji:String
    let geometrySize:CGSize
    var body: some View {
        ZStack {
            Text(emoji)
                .foregroundColor(Color.white)
            RoundedRectangle(cornerRadius: 12)
        }
        .aspectRatio(CGSize(width: 1, height: 1.19), contentMode: .fit)
    }
        
}


struct GameScreen_Previews: PreviewProvider {
    static var previews: some View {
        GameScreen(emojiList: ["emoji", "emoji2"])
    }
}
