//
//  HomeScreen.swift
//  MemorizeGame
//
//  Created by 이해주 on 2022/08/15.
//

import SwiftUI


struct HomeScreen: View {
    @State var navigateToViewB: Bool = false
    @ObservedObject var vm = HomeViewModel()
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                    .frame(height: 32)
                EmojiOptionListView(emojiOptionList: vm.emojiOptionList,
                                    selectedOptionIndex: $vm.selectedOptionIndex
                )
                Spacer()
                NavigationLink(
                    destination: GameScreen(emojiOptionKey: vm.selectedOptionIndex ?? 4),
                        isActive: $navigateToViewB,
                        label: {
                          EmptyView()
                        }
                      )
            }
            .navigationTitle("Memorize")
            .navigationBarItems(trailing: Button(action: {
                if(vm.selectedOptionIndex == nil){
                    print("nno")
                    
                } else {
                    navigateToViewB = true
                }
            }, label: {
                Text("aim")
            }))
        }
        .navigationViewStyle(.stack)
        
    }
}

struct EmojiOptionListView: View {
    var emojiOptionList: [Int : [String]]
    @Binding var selectedOptionIndex: Int?
    
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
