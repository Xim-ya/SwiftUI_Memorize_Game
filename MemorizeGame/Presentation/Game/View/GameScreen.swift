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
    
    private let columns = Array(1...3).map { _ in
      return  GridItem(.flexible(), spacing: 30)

    }

    private let tempList:[String] = ["1" , "2" , "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]    

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack (alignment:.center){
                    LazyVGrid(columns: columns) {
                        ForEach(tempList, id: \.self) { emoji in
                            CardView(emoji: emoji, geometrySize: geometry.size)
                        }
                    }
                    Spacer()
                    ZStack {
                        Text("Quit")
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 176, height: 46, alignment: .center)
                    }
                }
                .padding(.horizontal, 20)
            }
        }
        .navigationBarItems(trailing: Text("TIME"))
    }
}

struct CardView: View {
    let emoji:String
    let geometrySize:CGSize
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .frame(width: CGFloat(geometrySize.width * 0.3), height: CGFloat(geometrySize.width * 0.35), alignment: .center)
        
        
        
    }
        
}


struct GameScreen_Previews: PreviewProvider {
    static var previews: some View {
        GameScreen(emojiList: ["emoji", "emoji2"])
    }
}
