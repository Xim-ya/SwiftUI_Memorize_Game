//
//  GameViewModel.swift
//  MemorizeGame
//
//  Created by 이해주 on 2022/08/15.
//

import Foundation

class GameViewModel: ObservableObject {
    let emojiList:[String]
    
    init(emojiList:[String]) {
        self.emojiList = emojiList
    }
    
}
