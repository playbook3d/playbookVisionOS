//
//  ContentView.swift
//  playbookVOS
//
//  Created by Alex Carrizosa on 22/08/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    var body: some View {
        VStack {
            Model3D(named: "Scene", bundle: realityKitContentBundle)
                .padding(.bottom, 50)

            Text("Hello, world!")
        }
        .navigationTitle("Content")
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
