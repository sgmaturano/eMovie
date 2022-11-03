//
//  PhotoFileManager.swift
//  TheMovies
//
//  Created by Sergio Maturano on 25/10/2022.
//

import Foundation

class PhotoFileManager {
    
    static let shared = PhotoFileManager()

    private func createFile(filePath: URL, fileData: Data) -> Bool {
        do {
            try fileData.write(to: filePath)
            //Write is a success
            return true
        } catch {
            print(error.localizedDescription)
            //Error while trying to write
        }
        return false
    }
    
    func addFileToTempURL(fileData: Data) -> String? {
        let fileManager = FileManager.default
        let path = "\(Date().timeIntervalSince1970)".replacingOccurrences(of: ".", with: "_") + ".png"
        let dir = fileManager.temporaryDirectory.appendingPathComponent(path)
        if createFile(filePath: dir, fileData: fileData) {
            return path
        }
        return nil
    }
}
