//
//  EmojiModel.swift
//  MemorizeGame
//
//  Created by 이해주 on 2022/08/15.
//

import Foundation
import SwiftUI

class EmojiModel {
    private(set) var id: UUID
    private(set) var emoji: String
    
    init(id: UUID, emoji: String) {
        self.id = id
        self.emoji = emoji
    }
 
}

