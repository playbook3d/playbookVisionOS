//
//  AttachmentsProvider.swift
//  playbookVOS
//
//  Created by Alex Carrizosa on 22/08/23.
//

import SwiftUI
import Observation

@Observable final class AttachmentsProvider {
    var attachments: [ObjectIdentifier: AnyView] = [:]
    
    var sortegTagViewPairs: [(tag: ObjectIdentifier, view: AnyView)] {
        attachments.map{ key, value in
            (tag:key, view: value)
        }.sorted{ $0.tag < $1.tag }
    }
}
