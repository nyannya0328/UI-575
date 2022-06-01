//
//  CustomTabView.swift
//  UI-575
//
//  Created by nyannyan0328 on 2022/06/01.
//

import SwiftUI

struct CustomTabView: View {
    var animation : Namespace.ID
    @Binding var currentTab : Tab
    @State var  currentXValue : CGFloat = 0
    var body: some View {
        HStack(spacing:0){
            
            ForEach(Tab.allCases,id:\.rawValue){tab in
                
                TabView(tab: tab)
                    .overlay {
                        
                        Text(tab.rawValue)
                            .font(.callout.weight(.semibold))
                            .offset(y: currentTab == tab ? 10 : 200)
                    }
            }
            
            
        }
        .padding(.top)
        .background{
         
            Color.white
                .clipShape(BottomShape(currentXValue: currentXValue))
                .ignoresSafeArea(.container, edges: .bottom)
        }
    }
    @ViewBuilder
    func TabView(tab : Tab)->some View{
        
        GeometryReader{proxy in
            
            Button {
                
                withAnimation(.easeInOut){
                    
                    currentTab = tab
                    currentXValue = proxy.frame(in: .global).midX
                }
                
            } label: {
                
                Image(tab.rawValue)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 20, height: 20)
                    .foregroundColor(currentTab == tab ? .white : .gray.opacity(0.5))
                    .frame(maxWidth: .infinity,alignment: .center)
                    .background{
                     
                        
                        if currentTab == tab{
                            
                            Circle()
                                .fill(Color("Orange"))
                                .padding(-20)
                                .matchedGeometryEffect(id: "TAB", in: animation)
                        }
                    }
                    .contentShape(Rectangle())
                
            }
            .offset(y: currentTab == tab ? -50 : 0)
            .onAppear {
                
                if tab == Tab.allCases.first && currentXValue == 0{
                    
                    
                    currentXValue = proxy.frame(in: .global).midX
                }
            }

        }
        .frame(height:30)
    }
    
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

enum Tab : String,CaseIterable{
    
    
    case Home = "Home"
    case Cart = "Cart"
    case favorite = "Star"
    case profile = "Profile"
    
}


