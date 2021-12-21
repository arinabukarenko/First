//
//  StudentManager.swift
//  StudentList_18.11
//
//  Created by Арина  on 14.12.21.
//

import Foundation
class StudentManager {
let userDefaults = UserDefaults.standard

func saveData(maleList: [String]?, femaleList: [String]?){
    saveMaleList(maleList)
    saveFemaleList(femaleList)
}

private func saveMaleList(_ maleList: [String]?) {
    userDefaults.set(maleList, forKey: "MaleList")
}

private func saveFemaleList(_ femaleList: [String]?) {
    userDefaults.set(femaleList, forKey: "FemaleList")
}

func readFemaleList() -> [String] {
    if let femaleList = userDefaults.object(forKey: "FemaleList") as? [String]{
        return femaleList
    }
    return []
}

func readMaleList() -> [String] {
    if let maleList = userDefaults.object(forKey: "MaleList") as? [String]{
        return maleList
    }
    return []
}
}
