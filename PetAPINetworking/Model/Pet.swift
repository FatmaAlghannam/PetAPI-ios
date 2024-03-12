//
//  Pet.swift
//  PetAPINetworking
//
//  Created by fatma adnan on 04/03/2024.
//

import Foundation

struct Pet: Codable{
    
    var id: Int? = 0
    let name: String
    let adopted: Bool
    let image: String
    let age: Int
    let gender: String
}

