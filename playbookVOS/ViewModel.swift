//
//  ViewModel.swift
//  playbookVOS
//
//  Created by Alex Carrizosa on 22/08/23.
//

import Foundation
import RealityKit
import RealityKitContent
import Observation

@Observable final class ViewModel {
    let dashboardParameterName = "isOn"
    let consoleParameterName = "isOn"
    
    var rootEntity: Entity? = nil
    
    var showImmersiveContent: Bool = false
    var isConsoleScreenEnabled: Bool = false
    var isDashboardScreenEnabled: Bool = false
    
    init(rootEntity: Entity? = nil, showImmersiveContent: Bool = false, isConsoleScreenEnabled: Bool = false, isDashboardScreenEnabled: Bool = false){
        self.rootEntity = rootEntity
        self.showImmersiveContent = showImmersiveContent
        self.isConsoleScreenEnabled = isConsoleScreenEnabled
        self.isDashboardScreenEnabled = isDashboardScreenEnabled
    }
}
