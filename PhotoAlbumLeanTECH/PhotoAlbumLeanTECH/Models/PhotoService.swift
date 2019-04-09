//
//  PhotoService.swift
//  PhotoAlbumLeanTECH
//
//  Created by Andrew Daniels on 4/3/19.
//  Copyright © 2019 Andrew Daniels. All rights reserved.
//

import Foundation

class PhotoService {
    
    fileprivate static let apiUrlString = "https://jsonplaceholder.typicode.com/photos?albumId="
    
    
    static func getPhotosForAlbum(albumId: Int, complete: @escaping (_ response: [PhotoModel]) -> Void) {
        
        if let url = URL(string: apiUrlString + albumId.description) {
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                if let er = error {
                    print("There was an error retrieving the photo album with id: \(albumId) with error: \(er)")
                    return
                }
                
                guard let data = data else { return }
                do {
                    let model = try JSONDecoder().decode([PhotoModel].self, from: data)
                    complete(model)
                } catch {
                    print("There was an error decoding the photo album with id: \(albumId) with error: \(error)")
                }
                
            }.resume()
         

        }
        
    }
    
    
}
