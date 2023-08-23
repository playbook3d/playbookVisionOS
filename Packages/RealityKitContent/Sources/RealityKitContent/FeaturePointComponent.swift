//
//  FeaturePointComponent.swift
//
//
//  Created by Alex Carrizosa on 22/08/23.
//

import SwiftUI
import RealityKit

public enum Feature: String, Codable, CaseIterable {
    case console
    case dashboard
    case steringWheel
}

public struct FeaturePointComponent: Component, Codable {
    public var feature: Feature = .console
    public var name : String = "Console"
    public var description: String? = nil
    
    public init() {}
}
