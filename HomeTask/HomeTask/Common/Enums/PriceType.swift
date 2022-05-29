//
//  PriceType.swift
//  HomeTask
//
//  Created by Ali Asadi on 3/6/1401 AP.
//

import Foundation
enum PriceType: String, Decodable {
    case digitalPurchasePrice = "digitalPurchasePrice"
    case printPrice = "printPrice"

    init(from decoder: Decoder) throws {
      let label = try decoder.singleValueContainer().decode(String.self)
      self = PriceType(rawValue: label) ?? .digitalPurchasePrice
    }
}
