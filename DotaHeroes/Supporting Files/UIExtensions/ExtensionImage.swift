//
//  ExtensionImage.swift
//  DotaHeroes
//
//  Created by Антон Зайцев on 09.05.2020.
//  Copyright © 2020 Антон Зайцев. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func getImageFrom(link: String) {
        guard let url = URL(string: link) else { return }
        checkImageInCacheFrom(url: url)
    }
    
    func checkImageInCacheFrom(url: URL) {
        let fileName = url.lastPathComponent
        if let path = File.checkFor(file: fileName) {
            self.image = UIImage(contentsOfFile: path)
        } else {
            loadImageFrom(url: url, fileName: fileName)
        }
    }
    
    func loadImageFrom(url: URL, fileName: String) {
        URLSession.shared.dataTask(with: url) { data, response, error in
        guard
            let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
            let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
            let data = data, error == nil,
            let image = UIImage(data: data)
            else { return }
        DispatchQueue.main.async() {
            self.image = image
            do {
                let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
                let fileURL = documentsURL?.appendingPathComponent("\(fileName)")
                if let pngImageData = image.pngData(), let fileURL = fileURL {
                    try pngImageData.write(to: fileURL, options: .atomic)
                }
            } catch { }
        }
        }.resume()
    }
}

final class File {

    static func getDocumentsDirectory() -> String? {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        guard let documents: String = paths.first else {
            return nil
        }
        return documents
    }
    
    static func checkFor(file: String) -> String? {
        if let documents = getDocumentsDirectory() {
            let filePath = documents + "/\(file)"
            if let escapedPath = filePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
                if FileManager.default.fileExists(atPath: escapedPath) {
                    return escapedPath
                }
            }
        }
        return nil
    }
}
