//
//  ImageRequestModel.swift
//  NotWasted
//
//  Created by admin on 15/08/21.
//

import Foundation

struct ImageRequestModel: Encodable {
    let attachment: String
    let fileName: String
}

struct ImageResponseModel: Decodable {
    let imageText: String
}
