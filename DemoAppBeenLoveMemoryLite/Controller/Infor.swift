//
//  UserDefault.swift
//  DemoAppBeenLoveMemoryLite
//
//  Created by dohien on 22/09/2018.
//  Copyright © 2018 dohien. All rights reserved.
//

import UIKit
import os.log


class Infor: NSObject, NSCoding {
    
    //MARK: Properties
    
    var nameBoy: String
    var nameGirl: String
    var photoImageBoy: UIImage?
    var photoImageGirl: UIImage?
    
    //MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("infor")
    
    //MARK: Types
    
    struct PropertyKey {
        static let nameBoy = "nameBoy"
        static let nameGirl = "nameGirl"
        static let photoImageBoy = "photoImageBoy"
        static let photoImageGirl = "photoImageGirl"
    }
    
    //MARK: Initialization
    
    init?(nameBoy: String, nameGirl: String, photoImageBoy: UIImage?, photoImageGirl: UIImage?) {
        
        self.nameBoy = nameBoy
        self.nameGirl = nameGirl
        self.photoImageBoy = photoImageBoy
        self.photoImageGirl = photoImageGirl
        
    }
    
    //MARK: NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(nameBoy, forKey: PropertyKey.nameBoy)
        aCoder.encode(nameGirl, forKey: PropertyKey.nameGirl)
        aCoder.encode(photoImageBoy, forKey: PropertyKey.photoImageBoy)
        aCoder.encode(photoImageGirl, forKey: PropertyKey.photoImageGirl)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let nameBoy = aDecoder.decodeObject(forKey: PropertyKey.nameBoy) as? String else {
            os_log("Unable to decode the name for a Meal object.", log: OSLog.default, type: .debug)
            return nil
        }
        guard let nameGirl = aDecoder.decodeObject(forKey: PropertyKey.nameGirl) as? String else {
            os_log("Unable to decode the name for a Meal object.", log: OSLog.default, type: .debug)
            return nil
        }
        let photoImageBoy = aDecoder.decodeObject(forKey: PropertyKey.photoImageBoy)
        // Because photo is an optional property of Meal, just use conditional cast.
       let photoImageGirl = aDecoder.decodeObject(forKey: PropertyKey.photoImageGirl)
        
        // Must call designated initializer.
        self.init(nameBoy: nameBoy, nameGirl: nameGirl, photoImageBoy: photoImageBoy as? UIImage, photoImageGirl: photoImageGirl as? UIImage)
        
    }
}

//class LoveYou {
//    func datePicker() -> String {
//        return UserDefaults.standard.string(forKey: "datePicker")!
//    }
//    func nameBoy() -> String {
//        return UserDefaults.standard.string(forKey: "name")!
//    }
//    func nameGirl() -> String {
//        return UserDefaults.standard.string(forKey: "nu")!
//    }
//    func loveDay() -> String {
//        return UserDefaults.standard.string(forKey: "loveData")!
//    }
//    func year() -> String {
//        return UserDefaults.standard.string(forKey: "year")!
//    }
//    func month() -> String {
//        return UserDefaults.standard.string(forKey: "month")!
//    }
//    func week() -> String {
//        return UserDefaults.standard.string(forKey: "week")!
//    }
//    func day() -> String {
//        return UserDefaults.standard.string(forKey: "day")!
//    }
//    func hour() -> String {
//        return UserDefaults.standard.string(forKey: "hour")!
//    }
//    func minute() -> String {
//        return UserDefaults.standard.string(forKey: "minute")!
//    }
//    func second() -> String {
//        return UserDefaults.standard.string(forKey: "second")!
//    }
//}
