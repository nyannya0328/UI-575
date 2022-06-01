//
//  AppViewModel.swift
//  UI-575
//
//  Created by nyannyan0328 on 2022/06/01.
//

import SwiftUI

class AppViewModel:ObservableObject {
    
    @Published var currentTab : Tab = .Home
    
    @Published var currentMenu : String = "All"
    
    @Published var showDetail : Bool = false
    
    @Published var currentActiveItem : Funiture?
    

}

