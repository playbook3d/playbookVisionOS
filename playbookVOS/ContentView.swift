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
                    Text("This is a simulation for users that want to know more about Lucid Cars. Feel free to move around and explore the outside and inside of the vehicle")
                }
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
