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

    var body: some View {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}


//struct GameScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        GameScreen()
//    }
//}
