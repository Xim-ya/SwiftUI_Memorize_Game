//
//  HomeViewModel.swift
//  MemorizeGame
//
//  Created by 이해주 on 2022/08/15.
//

import Foundation

class HomeViewModel: ObservableObject {
    let emojiOptionList: [Int : [String]] = EmojiOptions // 홈 화면에 보여지는 옵션 리스트 [Dictionary]
    @Published var selectedOptionIndex: Int? // 선택된 옵션 카테고리 인덱스
    
    public func onOptionTapped(index: Int) {
        selectedOptionIndex = index;
    }
    
}
    
