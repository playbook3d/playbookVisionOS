//
//  FeatureDetailsView.swift
//  playbookVOS
//
//  Created by Alex Carrizosa on 22/08/23.
//

import SwiftUI

struct FeatureDetailsView: View {
    let name: String
    let description: String
    let viewModel: ViewModel
    
    @State private var showingFeatureDetails = false
    @Namespace private var animation
    
    private var titleFont: Font {
        .system(size: 48, weight: .semibold)
    }
    
    private var descriptionFont: Font {
        .system(size: 36, weight: .regular)
    }
    
    var body: some View {
        Group {
            VStack{
                ZStack(alignment: .center){
                    if !showingFeatureDetails {
                        Text(name)
                            .matchedGeometryEffect(id: "Name", in: animation)
                            .font(titleFont)
                            .padding()
                    }
                    
                    if showingFeatureDetails{
                        VStack(alignment: .leading, spacing: 10){
                            Text(name)
                                .matchedGeometryEffect(id: "Name", in: animation)
                                .font(titleFont)
                            
                            Text(description)
                                .font(descriptionFont)
                        }
                    }
                }
                .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
            }
            .frame(width: 400)
            .padding(24)
            .glassBackgroundEffect()
            .onTapGesture {
                withAnimation(.spring) {
                    showingFeatureDetails.toggle()
                }
            }
        }
    }
}

#Preview {
    FeatureDetailsView(
        name: "Test Feature Component",
        description: "Test component",
        viewModel: ViewModel())
}
