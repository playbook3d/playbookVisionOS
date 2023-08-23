//
//  ContentView.swift
//  artcenterDemo
//
//  Created by Alex Carrizosa on 15/08/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    var spaceId: String
    var viewModel: ViewModel

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    var areControlsShowing: Bool {
        viewModel.rootEntity != nil && viewModel.showImmersiveContent
    }

    var body: some View {
        @Bindable var viewModel = viewModel
        
        VStack{
            Grid(alignment: .leading, verticalSpacing: 30){
                Toggle(isOn: $viewModel.showImmersiveContent){
                    Text("Enable Car View")
                }
                .onChange(of: viewModel.showImmersiveContent){
                    Task{
                        if viewModel.showImmersiveContent{
                            await openImmersiveSpace(id: spaceId)
                        } else {
                            await dismissImmersiveSpace()
                        }
                    }
                }
                
                GridRow{
                    Toggle(isOn: $viewModel.isConsoleScreenEnabled){
                        Text("Enable console screen")
                    }
                    .onChange(of: viewModel.isConsoleScreenEnabled){
                        viewModel.isConsoleScreenEnabled.toggle()
                    }
                }
                .disabled(!areControlsShowing)
                .opacity(areControlsShowing ? 1 : 0.5)
                
                GridRow{
                    Toggle(isOn: $viewModel.isDashboardScreenEnabled){
                        Text("Enable dashboard screen")
                    }
                    .onChange(of: viewModel.isDashboardScreenEnabled){
                        viewModel.isDashboardScreenEnabled.toggle()
                    }
                }
                .disabled(!areControlsShowing)
                .opacity(areControlsShowing ? 1 : 0.5)
            }
        }
        .animation(.default, value: areControlsShowing)
        .frame(width: 500)
        .padding(30)
        .glassBackgroundEffect()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView(spaceId: "Immersive", viewModel: ViewModel(rootEntity: Entity()))
}
