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
        NavigationView {
            VStack {
                Spacer()
                    .frame(height: 32)
                EmojiOptionListView(emojiOptionList: vm.emojiOptionList, selectedOptionIndex: vm.selectedOptionIndex)
                Spacer()
            }
            .navigationTitle("Memorize")
            .navigationBarItems(trailing: NavigationLink(destination: GameScreen(emojiList: ["emoji", "emoji2"]), label: {Text("Start Game")}))
        }
        .navigationViewStyle(.stack)
        
    }
}

struct EmojiOptionListView: View {
    var emojiOptionList: [Int : [String]]
    @State var selectedOptionIndex: Int?
    var body: some View {
        GeometryReader { geometry in
            List(Array(emojiOptionList), id: \.key){ key, value in
                Button {
                    selectedOptionIndex = key
                } label: {
                    HStack {
                        Text(EmojiOptionKeyMap[key]!)
                        ForEach(value, id: \.self){ item in
                            Text(item)
                        }
                        .listRowInsets(EdgeInsets())
                        Spacer()
                        if selectedOptionIndex == key {
                             Image(systemName: "checkmark")
                                .foregroundColor(Color.blue)
                        }
                    }
                }
                .overlay(VStack{Divider().offset(x: 0, y: 20)})
                .listRowSeparator(.hidden)
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
