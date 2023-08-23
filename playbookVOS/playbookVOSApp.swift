//
//  playbookVOSApp.swift
//  playbookVOS
//
//  Created by Alex Carrizosa on 22/08/23.
//

import SwiftUI
import RealityKitContent
import ARKit
import RealityKit

@main
struct playbookVOSApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    private let immersiveSpaceIndentifier = "Immersive"
    
    @State private var lucidCarImmersionStyle: ImmersionStyle = .full
    @State private var lucidCarMixedImmersionStyle: ImmersionStyle = .mixed
    
    @State private var viewModel = ViewModel()
    
    init() {
        RealityKitContent.FeaturePointComponent.registerComponent()
        FeaturePointRuntimeComponent.registerComponent()
    }
    
    var body: some SwiftUI.Scene {
        WindowGroup {
            ContentView(spaceId: immersiveSpaceIndentifier, viewModel: viewModel)
        }
        .windowStyle(.plain)
        
        ImmersiveSpace(id: immersiveSpaceIndentifier){
            PlaybookView(viewModel: viewModel)
        }
        .immersionStyle(selection: $lucidCarImmersionStyle, in: .full)
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: UIApplication) -> Bool {
        return true
    }
}
