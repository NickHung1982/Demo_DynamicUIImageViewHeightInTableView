//
//  TimeSetCodeTests.swift
//  TimeSetCodeTests
//
//  Created by Nick on 6/12/17.
//  Copyright © 2017 NickOwn. All rights reserved.
//

import XCTest
@testable import TimeSetCode

class TimeSetCodeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        getData()
    }
    func getData(){
        //assume get data from API with JSON format
        do{
            if let file = Bundle.main.url(forResource: "sample", withExtension: "json"){
                let data = try Data(contentsOf: file)
             
                let json = JSON(file)

                guard let dcAr = json["messages"].array else {
                    return
                }
                for dc in dcAr {
                    let userName = dc["username"].string ?? ""
                    print(userName)
                }
                print(json)
                
            }
        }catch{
            print("error")
        }
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
