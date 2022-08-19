//
//  GameViewModel.swift
//  MemorizeGame
//
//  Created by 이해주 on 2022/08/15.
//

import Foundation

class GameViewModel: ObservableObject {
    
    
//    let emojiList:[String]
    var emojiModelList: [EmojiModel] = []
    
    func makeEmojiList(emojiList: [String]) -> [EmojiModel] {
        var emojiPairList: [EmojiModel] = []

        // Make Pair
        for index in 0...5 {
            for _ in 1...2 {
                emojiPairList.append(EmojiModel(id: UUID(), emoji: emojiList[index]))
            }
        }
        
        return emojiPairList;
    }
    
    init(emojiOptionKey: Int) {
            self.emojiModelList = makeEmojiList(emojiList: EmojiOptions[emojiOptionKey]!)
    }
    
  
}



