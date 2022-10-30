//
//  Quack.swift
//  quacker
//
//  Created by Abby Dominguez on 30/10/22.
//

import SwiftUI
struct Quack: Identifiable {
    public var id = UUID()
    public var owner: String
    public var contents: String 
}
