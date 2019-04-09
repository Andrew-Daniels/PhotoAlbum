//
//  File.swift
//  PhotoAlbumLeanTECH
//
//  Created by Andrew Daniels on 4/3/19.
//  Copyright © 2019 Andrew Daniels. All rights reserved.
//

import Foundation


class PhotoModel: Decodable {
    
    var albumId: Int!
    var id: Int!
    var title: String!
    var url: String!
    var thumbnailUrl: String!
    
}
