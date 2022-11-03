//
//  Quack.swift
//  quacker
//
//  Created by Abby Dominguez on 30/10/22.
//

import SwiftUI
struct Quack: Identifiable {
    public var id = UUID()
    public var uidstring: String?
    public var owner: String
    public var contents: String 
}
struct QuackFetch : Identifiable {
    public var id = UUID()
    public var owner: String
    public var contents: String
    public var ownerFullName : String
}
