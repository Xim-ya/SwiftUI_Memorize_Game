//
//  EmojiModel.swift
//  MemorizeGame
//
//  Created by 이해주 on 2022/08/15.
//

import Foundation

class EmojiModel {
    private(set) var id: Int
    private(set) var emoji: String
    
    init(id: Int, emoji: String) {
        self.id = id
        self.emoji = emoji
    }
 
}
