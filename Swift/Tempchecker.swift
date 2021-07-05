//
//  Tempchecker.swift
//  
//
//  Created by Jason Hoffman on 12/28/20.
//

import Foundation

// Their solution
class TempTracker {

    // for mode
    private var occurrences = Array(repeating: 0, count: 111) // array of 0
    private var maxOccurrences = 0
    private var mode: Int?
    
    // for mean
    private var numberOfReadings = 0
    private var totalSum = 0.0 // mean should be double
    private var mean: Double?

    // implement methods to track the max, min, mean, and mode
    private var minTemp: Int?
    private var maxTemp: Int?
    
    // records a new temperature
    func insert(temperature: Int) {
        
        // for mode
        occurrences[temperature] += 1;
        if occurrences[temperature] > maxOccurrences {
            mode = temperature
            maxOccurrences = occurrences[temperature]
        }
        
        // for mean
        numberOfReadings += 1
        totalSum += Double(temperature)
        mean = totalSum / Double(numberOfReadings)
        
        // for min and max
        if let maxTemp = maxTemp {
            self.maxTemp = max(maxTemp, temperature)
        } else {
            self.maxTemp = temperature
        }
        
        if let minTemp = minTemp {
            self.minTemp = min(minTemp, temperature)
        } else {
            self.minTemp = temperature
        }
    }

    // returns the highest temp we've seen so far
    func getMax() -> Int? {
        return maxTemp
    }

    // returns the lowest temp we've seen so far
    func getMin() -> Int? {
        return minTemp
    }

    // returns the mean of all temps we've seen so far
    func getMean() -> Double? {
        return mean
    }

    // return a mode of all temps we've seen so far
    func getMode() -> Int? {
        return mode
    }
}


















// tests

import XCTest

func XCTAssertEqual(_ actual: Double?, _ expected: Double, accuracy: Double,
                    _ message: String, line: UInt = #line) {
    if let actual = actual {
        XCTAssertEqual(actual, expected, accuracy: accuracy, message, line: line)
    } else {
        XCTAssertEqual(nil, expected, message, line: line)
    }
}

class Tests: XCTestCase {

    func testTemperatureTracker() {
        let precision = 1e-6

        let tracker = TempTracker()
        var msg: String

        tracker.insert(temperature: 50)
        msg = "failed on first temp recorded"
        XCTAssertEqual(tracker.getMax(), 50, "max \(msg)")
        XCTAssertEqual(tracker.getMin(), 50, "min \(msg)")
        XCTAssertEqual(tracker.getMean(), 50.0, accuracy: precision, "mean \(msg)")
        XCTAssertEqual(tracker.getMode(), 50, "mode \(msg)")

        tracker.insert(temperature: 80)
        msg = "failed on higher temp recorded"
        XCTAssertEqual(tracker.getMax(), 80, "max \(msg)")
        XCTAssertEqual(tracker.getMin(), 50, "min \(msg)")
        XCTAssertEqual(tracker.getMean(), 65.0, accuracy: precision, "mean \(msg)")
        XCTAssert(tracker.getMode() == 50 || tracker.getMode() == 80, "mode \(msg)")

        tracker.insert(temperature: 80)
        msg = "failed on third temp recorded"
        XCTAssertEqual(tracker.getMax(), 80, "max \(msg)")
        XCTAssertEqual(tracker.getMin(), 50, "min \(msg)")
        XCTAssertEqual(tracker.getMean(), 70.0, accuracy: precision, "mean \(msg)")
        XCTAssertEqual(tracker.getMode(), 80, "mode \(msg)")

        tracker.insert(temperature: 30)
        msg = "failed on lower temp recorded"
        XCTAssertEqual(tracker.getMax(), 80, "max \(msg)")
        XCTAssertEqual(tracker.getMin(), 30, "min \(msg)")
        XCTAssertEqual(tracker.getMean(), 60.0, accuracy: precision, "mean \(msg)")
        XCTAssertEqual(tracker.getMode(), 80, "mode \(msg)")
    }

    static let allTests = [
        ("testTemperatureTracker", testTemperatureTracker)
    ]
}

XCTMain([testCase(Tests.allTests)])
