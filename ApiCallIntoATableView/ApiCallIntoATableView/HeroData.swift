//
//  HeroData.swift
//  ApiCallIntoATableView
//
//  Created by Sainath Bamen on 16/05/23.
//

import Foundation

struct HeroStats:Decodable{
    let localized_name:String
    let primary_attr:String
    let attack_type:String
    let legs:Int
    let img:String
    
}
