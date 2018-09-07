//
//  DemoAppBeenLoveMemoryLiteTests.swift
//  DemoAppBeenLoveMemoryLiteTests
//
//  Created by dohien on 28/08/2018.
//  Copyright © 2018 dohien. All rights reserved.
//

import XCTest
@testable import DemoAppBeenLoveMemoryLite

class DemoAppBeenLoveMemoryLiteTests: XCTestCase {
    
    func testMealInitializatianSucceeds(){
        // xếp hạng 0
        let zeroRating = Meal.init(name: "Zero", photo: nil, rating: 0)
        XCTAssertNotNil(zeroRating)
        // xếp hạng cao nhất
        let positiveRatingMeal = Meal.init(name: "Positive", photo: nil, rating: 5)
        XCTAssertNotNil(positiveRatingMeal)
        //XCT xác định bữa ăn có trả về hay k
    }
    func testMealInitializationFails(){
        let negativeRatingMeal = Meal.init(name: "Negative", photo: nil, rating: -1)
        XCTAssertNil(negativeRatingMeal)
        let emptyStringMeal = Meal.init(name: "", photo: nil, rating: 0)
        XCTAssertNil(emptyStringMeal)
        let largeRatingMeal = Meal.init(name: "Large", photo: nil, rating: 6)
        XCTAssertNil(largeRatingMeal)
    }
}
