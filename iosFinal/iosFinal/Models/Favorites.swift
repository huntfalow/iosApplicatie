//
//  Favorites.swift
//  iosFinal
//
//  Created by Vincent on 19/01/2020.
//  Copyright © 2020 Vincent. All rights reserved.
//

import Foundation

struct Favorite: Codable {
   let idDrink: String?
   let strDrink: String?
   let strInstructions: String
    
   static let DocumentsDirectory = FileManager.default.urls(for:.documentDirectory, in: .userDomainMask).first!
   static let ArchiveURL =
    DocumentsDirectory.appendingPathComponent("favorites")
       .appendingPathExtension("plist")

    static func loadFavorites() -> [Favorite]?  {
        guard let codedFavorites = try? Data(contentsOf: ArchiveURL) else {return nil}
        
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode(Array<Favorite>.self,
              from: codedFavorites)
        }
    static func saveFavorites(_ favorites:[Favorite]){
      let propertyListEncoder = PropertyListEncoder()
        
        let codedFavorites = try? propertyListEncoder.encode(favorites)
        try? codedFavorites?.write(to: ArchiveURL, options: .noFileProtection)
    }
       
        
    static func loadSampleFavorites() -> [Favorite] {
          let fav1 = Favorite(idDrink: "1", strDrink: "moji", strInstructions: "zuipen")
        let fav2 = Favorite(idDrink: "2", strDrink: "mojii", strInstructions: "zuipen2")
        return  [fav1,fav2]
      }
}
