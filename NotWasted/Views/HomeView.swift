//
//  SwiftUIView.swift
//  NotWasted
//
//  Created by admin on 29/06/21.
//

import SwiftUI

struct HomeView: View {
    @State var selectedTabIndex = 0
    
    let tabBarImageNames = ["book", "camera", "person"]
    let tabBarSegmentName = ["Pantry", "Scan Receipt", "Account"]
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    switch selectedTabIndex {
                    case 0:
                        PantryView()
                    case 1:
                        ScanReceiptView()
                    case 2:
                        AccountView()
                    default:
                        PantryView()
                    }
                }
                    
                Spacer()
                
                Divider()
                
                HStack {
                    ForEach (0..<3) { num in
                        Button(action: {
                            selectedTabIndex = num
                        }, label: {
                            Spacer()
                            VStack {
                                
                                if num == 1 {
                                    Image(systemName: tabBarImageNames[num])
                                        .font(.system(size: 36, weight: .bold))
                                        .foregroundColor(selectedTabIndex == num ? Color(.black) : .init(white: 0.8))
                                } else {
                                
                                Image(systemName: tabBarImageNames[num])
                                    .font(.system(size: 24, weight: .bold))
                                    .foregroundColor(selectedTabIndex == num ? Color(.black) : .init(white: 0.8))
    //                            Text(tabBarSegmentName[num])
    //                                .multilineTextAlignment(.center)
                                }
                            }
                            
                            Spacer()
                        })
                    }
                }
            }.navigationBarHidden(false)
            .navigationBarBackButtonHidden(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
        }
    }
}

struct TabBarView: View {
    let tabBarImageNames = ["book", "camera", "person"]
    
    //@State var selectedTabIndex: Int
    
    var body: some View {
//        HStack {
//            ForEach (0..<5) { num in
//                Button(action: {
//
//                }, label: {
//                    Spacer()
//                    Image(systemName: tabBarImageNames[num])
//                        .font(.system(size: 24, weight: .bold))
//                        .foregroundColor(Color(.label))
//                    Spacer()
//                })
//            }
//        }
        
        TabView() {
            Text("Pantry")
                .tabItem {
                    Image(systemName: "book")
                    Text("Pantry")
                }
            Text("Log Dish")
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Log Dish")
                }
            Text("Log Groceries")
                .tabItem {
                    Image(systemName: "camera")
                    Text("Scan Receipt")
                }
            Text("Recipes")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Recipes")
                }
            Text("Account")
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
          }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
