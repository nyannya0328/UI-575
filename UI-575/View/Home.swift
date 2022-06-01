//
//  Home.swift
//  UI-575
//
//  Created by nyannyan0328 on 2022/06/01.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var model : AppViewModel
    var animation : Namespace.ID
    
    let black : Color = Color("Black")
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 15) {
                VStack(alignment: .leading, spacing: 13) {
                    
                    
                    
                    Text("Best Furniture")
                        .font(.largeTitle.weight(.black))
                    
                    Text("Perfect Choice")
                        .font(.title3.weight(.semibold))
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                
                
                HStack{
                    
                    
                    HStack{
                        
                        Image("Search")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(.black)
                            .frame(width: 20, height: 20)
                        
                        TextField("", text: .constant(""))
                        
                    }
                    .padding(.vertical,13)
                    .padding(.horizontal)
                    .background{
                     
                        
                        RoundedRectangle(cornerRadius: 19, style: .continuous)
                            .fill(.white)
                    }
                    
                    
                    Button {
                        
                    } label: {
                        
                        Image("Filter")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(.black)
                            .frame(width: 20, height: 20)
                        
                    }
                    .padding(.vertical,13)
                    .padding(.horizontal)
                    .background{
                     
                        
                        RoundedRectangle(cornerRadius: 19, style: .continuous)
                            .fill(.white)
                    }

                    
                }
                
                
                
              //  TabButton()
                  
                
                ForEach(furnitures){funiture in
                    
                    CardView(funiture: funiture)
                }
                
                
                
            }
            .padding()
    
            
        }
        .padding(.bottom,100)
    }
    
    @ViewBuilder
    func CardView(funiture : Funiture)->some View{
        
        HStack(spacing:10){
            
            Group{
                
                if model.currentActiveItem?.id == funiture.id && model.showDetail{
                    
                    
                    Image(funiture.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .opacity(0)
                    
                    
                }
                else{
                    
                    Image(funiture.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: funiture.id + "Image", in: animation)
                    
                    
                }
            }
            .background(Color("BG"))
            .frame(width: 150)
            
            
            VStack(alignment: .leading, spacing: 15) {
                
                Group{
                    
                    
                    if model.currentActiveItem?.id == funiture.id && model.showDetail{
                        
                        Text(funiture.title)
                            .font(.title2.weight(.semibold))
                            .foregroundColor(.black)
                            .opacity(0)
                        
                        
                        Text("By Seto")
                            .font(.title3.weight(.semibold))
                            .foregroundColor(.gray)
                            .opacity(0)
                        
                        
                    }
                    else{
                        
                        Text(funiture.title)
                            .font(.title2.weight(.semibold))
                            .foregroundColor(.black)
                            .matchedGeometryEffect(id: funiture.id +  "TITLE", in: animation)
                        
                        
                        Text("By Seto")
                            .font(.title3.weight(.semibold))
                            .foregroundColor(.gray)
                            .matchedGeometryEffect(id: funiture.id +  "By Seto", in: animation)
                        
                        
                    }
                    
                }
                
                
                
                
                Text(funiture.subTitle)
                    .font(.caption2)
                    .lineLimit(1)
                    .foregroundColor(.gray)
                
                
                HStack{
                    
                    Text("300")
                        .font(.title3.weight(.black))
                    
                    
                    Spacer()
                    
                    
                    Button {
                        
                    } label: {
                        
                        Text("Buy")
                            .font(.callout.weight(.semibold))
                            .foregroundColor(.white)
                            .padding(.vertical,14)
                            .padding(.horizontal,20)
                            .background{
                             
                                
                                RoundedRectangle(cornerRadius: 30, style: .continuous)
                                    .fill(Color("Orange"))
                            }
                    }

                }
                
                
            }
            .padding(.vertical)
              .frame(maxWidth: .infinity,alignment: .topLeading)
            
            
        }
        .padding()
        .background{
         
            
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(.white)
        }
        .onTapGesture {
            
            
            withAnimation(.easeInOut){
                
                model.currentActiveItem = funiture
                model.showDetail = true
            }
        }
        
        
    }
    @ViewBuilder
    func TabButton()->some View{


        HStack{

            ForEach(["All","Chair","Table","Lamp","Floor"],id:\.self){tab in


                Text(tab)
                  .font(.title3.weight(.semibold))
                  .foregroundColor(model.currentMenu == tab ? .white : .black)
                  .frame(maxWidth: .infinity,alignment: .center)
                  .padding(.vertical)
                  .background{


                      if model.currentMenu == tab{

                          Capsule()
                              .fill(black)
                              .matchedGeometryEffect(id: "TABBUTTON", in: animation)
                      }
                  }
                  .contentShape(Capsule())
                  .onTapGesture {

                      withAnimation{

                          model.currentMenu = tab
                      }
                  }

            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
