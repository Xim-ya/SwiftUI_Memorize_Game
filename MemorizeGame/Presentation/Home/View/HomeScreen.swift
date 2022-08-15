//
//  HomeScreen.swift
//  MemorizeGame
//
//  Created by 이해주 on 2022/08/15.
//

import SwiftUI

struct HomeScreen: View {
    let vm = HomeViewModel()
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 80)
            Text("Memorize")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 34, weight: .bold, design: .default))
                .padding(.horizontal, 20)
            Spacer()
                .frame(height: 32)
            EmojiOptionListView(emojiOptionList: vm.emojiOptionList)
            Spacer()
        }
    }
}

struct EmojiOptionListView: View {
    var emojiOptionList: [Int : [String]]
    var body: some View {
        GeometryReader { geometry in
            List(Array(emojiOptionList), id: \.key){ key, value in
                HStack {
                    Text(EmojiOptionKeyMap[key]!)
                    ForEach(value, id: \.self){ item in
                        Text(item)
                    }
                    .listRowInsets(EdgeInsets())
                }
                .listRowSeparator(.hidden)
                .frame(width: geometry.size.width - 40, alignment: .leading)
                .overlay(VStack{Divider().offset(x: 0, y: 20)})
            }
            .listStyle(PlainListStyle())
            .listRowInsets(EdgeInsets(.init(top: 0, leading: 40, bottom: 0, trailing: 0)))
        }
        .padding(.horizontal, 10)
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
