//
//  User.swift
//  quacker
//
//  Created by Abby Dominguez on 30/10/22.
//

import SwiftUI
struct User: Identifiable{
    public var id: String
    public var bio: String
    public var fullName: String
    public var owner: String
    public var b64image: String
    init(id: String, bio: String, fullName: String, owner: String, b64image: String) {
        self.id = id
        self.bio = bio
        self.fullName = fullName
        self.owner = owner
        self.b64image = b64image
    }
}
