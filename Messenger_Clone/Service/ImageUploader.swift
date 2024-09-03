//
//  ImageUploader.swift
//  Messenger_Clone
//
//  Created by Abrar Hamim on 3/9/24.
//

import UIKit
import FirebaseStorage

struct ImageUploader {
    
    func uploadImage(_ image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.1) else { return nil }
        let fileName = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "\(fileName)")
       
        let _ = try await ref.putDataAsync(imageData)
        let url = try await ref.downloadURL()
        
        return url.absoluteString
    }
}
