//
//  DetailView.swift
//  UI-575
//
//  Created by nyannyan0328 on 2022/06/01.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var model : AppViewModel
    var animation : Namespace.ID
    
    var funiture : Funiture
    
    @State var currentActiveColor : String = "Color1"
    @State var showDetailContent : Bool = false
    @State var count : Int = 0
    var body: some View {
        GeometryReader{proxy in
            
             let size = proxy.size
            
            VStack{
                
                
                HStack{
                    
                    Button {
                        
                        withAnimation(.easeInOut){
                            
                            
                            showDetailContent = false
                        }
                        
                        withAnimation(.easeInOut.delay(0.05)){
                            
                            model.showDetail = false
                        }
                        
                    } label: {
                        
                        
                        Image(systemName:"chevron.left")
                            .font(.title.weight(.semibold))
                            .foregroundColor(.gray)
                            .padding(10)
                            .background{
                             
                                Capsule()
                                    .fill(.white)
                            }
                    }
                    
                    
                    Spacer()
                    
                    
                    Button {
                        
                    } label: {
                        
                        
                        Image(systemName:"suit.heart.fill")
                            .font(.title.weight(.semibold))
                            .foregroundColor(.red)
                            .padding(10)
                            .background{
                             
                                Capsule()
                                    .fill(.white)
                            }
                    }
                    
                    

                }
                .padding(.horizontal)
                .opacity(showDetailContent ? 1 : 0)
                
                
                Image(funiture.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: funiture.id + "Image", in: animation)
                    .frame(height: size.height / 3)
                
                
                VStack{
                    
                    HStack{
                        
                        
                        VStack(alignment: .leading, spacing: 14) {
                            
                            Text(funiture.title)
                                .font(.title2.weight(.semibold))
                                .foregroundColor(.black)
                                .matchedGeometryEffect(id: funiture.id +  "TITLE", in: animation)
                            
                            
                            Text("By Seto")
                                .font(.title3.weight(.semibold))
                                .foregroundColor(.gray)
                                .matchedGeometryEffect(id: funiture.id +  "By Seto", in: animation)
                            
                            
                            
                        }
                          .frame(maxWidth: .infinity,alignment: .leading)
                        
                        
                        
                        Button {
                            
                        } label: {
                            
                            Label {
                                
                                Text("5.0")
                                
                            } icon: {
                                
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                            }
                            .padding(.vertical,10)
                            .padding(.horizontal,20)
                            .background{
                             
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .strokeBorder(.gray,lineWidth: 2)
                            }

                        }

                    }
                    
                    
                    Text("Crafted with a perfect construction by Seto Febriant and have a balancing ergonomic for humans body, top quality leather in the back of the rest.")
                        .font(.callout.weight(.semibold))
                        .foregroundColor(.gray)
                        .padding(.vertical)
                    
                    
                    
                    
                    HStack(spacing:15){
                        
                        Text("Color")
                            .font(.title.weight(.bold))
                            .foregroundColor(.black)
                        
                        ForEach(["Color1","Color2","Color3"],id:\.self){color in
                            
                            Circle()
                                .fill(Color(color))
                                .frame(width: 20, height: 20)
                                .background{
                                 
                                    Circle()
                                        .strokeBorder(.gray,lineWidth: 2)
                                        .padding(-5)
                                    
                                }
                            
                        }
                        
                        
                        Spacer()
                        
                        
                        HStack(spacing:10){
                            
                            
                            Image(systemName: "minus")
                                .onTapGesture {
                                    
                                    if count > 0{count += 1}
                                    
                                }
                            
                            Text("\(count)")
                            
                            
                            Image(systemName: "plus")
                                .onTapGesture {
                                    
                                    count -= 1
                                    
                                }
                            
                            
                            
                        }
                    }
                    
                    
                    
                    Spacer()
                    
                    
                    Rectangle()
                        .fill(.red.opacity(0.3))
                        .frame(height:1)
                    
                    
                    HStack{
                        
                        Text("$300")
                            .font(.largeTitle.weight(.bold))
                            .foregroundColor(.primary)
                        
                        Spacer()
                        
                        
                        
                        Button {
                            
                        } label: {
                            
                            Text("Buy Now")
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
                .padding(.top,35)
                .padding(.horizontal)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background{
                 
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(.white)
                        .ignoresSafeArea()
                }
                .opacity(showDetailContent ? 1 : 0)
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .top)
            
            
      
            
            
            
            
            
        }
     
      
        .background{
        
         Color("BG")
                .opacity(showDetailContent ? 1 : 0)
             
        }
        .onAppear {
            
            withAnimation(.easeInOut){
                
                showDetailContent = true
            }
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
