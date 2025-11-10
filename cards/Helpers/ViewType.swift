//
//  ViewType.swift
//  cards
//
//  Created by tryingthebest on 09/11/2025.
//

import SwiftUI

protocol ViewType: View {

    var inViewController: UIViewController { get }

}

extension ViewType {

    var inViewController: UIViewController {
        UIHostingController(rootView: self)
    }

}
