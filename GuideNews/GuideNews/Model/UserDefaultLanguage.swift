//
//  UserDefaultLanguage.swift
//  GuideNews
//
//  Created by MacOS on 14.04.2021.
//

import Foundation

class Language {
   static  func ChosenLanguage() -> String {
   
    let savedDataControl = UserDefaults.standard
        var chosenLanguage = ""
        if let chosenLanguageArray = savedDataControl.array(forKey: "countryInfo") as? [String]  {
            chosenLanguage = chosenLanguageArray[0]
        }
        return chosenLanguage
    }
}
