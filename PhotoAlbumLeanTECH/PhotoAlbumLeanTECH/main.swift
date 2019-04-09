//
//  main.swift
//  PhotoAlbumLeanTECH
//
//  Created by Andrew Daniels on 4/3/19.
//  Copyright © 2019 Andrew Daniels. All rights reserved.
//

import Foundation

func getAlbumInformation() {
    
    print("What photo album would you like to see?")
    print("Enter a photo album id then press enter: (ex. 1)")
    
    var response = readLine()
    
    while response == nil || Int(response!) == nil {
        print("Please enter a valid album id:")
        response = readLine()
    }
    
    guard let albumId = Int(response!) else { return }
    
    PhotoService.getPhotosForAlbum(albumId: albumId) { (photos) in
        for photo in photos {
            
            if let id = photo.id, let title = photo.title {
                print("[\(id)] \(title)")
            }
            
        }
        
        dispatchGroup.enter()
        dispatchGroup.leave()
        getAlbumInformation()
        
    }
    
    dispatchGroup.notify(queue: DispatchQueue.main) {
        exit(EXIT_SUCCESS)
    }
    
}

let dispatchGroup = DispatchGroup()
dispatchGroup.enter()

getAlbumInformation()

dispatchMain()
