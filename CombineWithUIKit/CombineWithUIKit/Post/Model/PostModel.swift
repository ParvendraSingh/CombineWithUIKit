//
//  PostModel.swift
//  CombineWithUIKit
//
//  Created by Parvendra Kumar on 25/08/23.
//

import Foundation


struct PostModel: Decodable {
    var userId: Int?
    var id: Int?
    var title: String?
    var body: String?
}

