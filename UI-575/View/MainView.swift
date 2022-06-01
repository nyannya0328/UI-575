//
//  MainView.swift
//  UI-575
//
//  Created by nyannyan0328 on 2022/06/01.
//

import SwiftUI

struct MainView: View {
    @StateObject var model : AppViewModel = .init()
    @Namespace var animation
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        TabView(selection: $model.currentTab) {
            
            
          Home(animation: animation)
                .environmentObject(model)
                .setUP()
                .tag(Tab.Home)
            
            Text("B")
                .setUP()
                .tag(Tab.Cart)
            
            Text("C")
                .setUP()
                .tag(Tab.favorite)
            
            Text("D")
                .setUP()
                .tag(Tab.profile)
            
        }
        
        
        .overlay(alignment: .bottom) {
            
            
            CustomTabView(animation: animation, currentTab: $model.currentTab)
                .offset(y: model.showDetail ? 200 : 0)
                .environmentObject(model)
            
            
            
        }
        .overlay {
            
            if let funiture = model.currentActiveItem,model.showDetail{
                
                
                DetailView(animation: animation, funiture: funiture)
                    .environmentObject(model)
                    .transition(.offset(x: 1, y: 1))
                
            }
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension View{
    
    func getSafeArea()->UIEdgeInsets{
        
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            
            return .zero
        }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else{
            
            return .zero
        }
        
        return safeArea
    }
    
    func setUP() -> some View{
        
        self
          .frame(maxWidth: .infinity, maxHeight: .infinity)
       
          .background{
              
              Color("BG").ignoresSafeArea()
              
          }
        
        
        
    }
}
