import Foundation


// Mine
func mergeArrays(_ myArray: [Int], _ alicesArray: [Int]) -> [Int] {
    
    // O(n log n)
//    let combined = myArray + alicesArray
//    let merged = combined.sorted()

    if myArray.isEmpty {
        return alicesArray
    } else if alicesArray.isEmpty {
        return myArray
    }
    
    var n = 0
    let max = myArray.count + alicesArray.count - 1
    var merged = [Int]()
    
    var myArray = myArray
    var alicesArray = alicesArray
    
    while n <= max {
        
        if let m = myArray.first, let  a = alicesArray.first {
            if m < a {
                merged.append(m)
                myArray.removeFirst()
            } else if a < m {
                merged.append(a)
                alicesArray.removeFirst()
            }
        }
        
        if alicesArray.isEmpty {
            myArray.compactMap {
                merged.append($0)
                myArray.removeFirst()
            }
        }
        
        if myArray.isEmpty {
            alicesArray.compactMap {
                merged.append($0)
                alicesArray.removeFirst()
            }
        }
        
        n += 1
    }
    
    return merged
}

// Theirs
func mergeArrays(_ myArray: [Int], _ alicesArray: [Int]) -> [Int] {

    // set up our mergedArray
    var mergedArray = Array(repeating: 0, count: myArray.count + alicesArray.count)

    var currentIndexAlices = 0
    var currentIndexMine = 0
    var currentIndexMerged = 0

    while currentIndexMerged < mergedArray.count {

        let isMyArrayExhausted = currentIndexMine >= myArray.count
        let isAlicesArrayExhausted = currentIndexAlices >= alicesArray.count

        // case: next comes from my array
        // my array must not be exhausted, and EITHER:
        // 1) alice's array IS exhausted, or
        // 2) the current element in my array is less
        //    than the current element in alice's array
        if !isMyArrayExhausted &&
            (isAlicesArrayExhausted || myArray[currentIndexMine] < alicesArray[currentIndexAlices]) {

            mergedArray[currentIndexMerged] = myArray[currentIndexMine]
            currentIndexMine += 1

            // case: next comes from alice's array
        } else {
            mergedArray[currentIndexMerged] = alicesArray[currentIndexAlices]
            currentIndexAlices += 1
        }

        currentIndexMerged += 1
    }

    return mergedArray
}



// tests

import XCTest

class Tests: XCTestCase {

    func testBothArraysAreEmpty() {
        let myArray: [Int] = []
        let alicesArray: [Int] = []
        let actual = mergeArrays(myArray, alicesArray)
        let expected: [Int] = []
        XCTAssertEqual(actual, expected)
    }

    func testFirstArrayIsEmpty() {
        let myArray: [Int] = []
        let alicesArray = [1, 2, 3]
        let actual = mergeArrays(myArray, alicesArray)
        let expected = [1, 2, 3]
        XCTAssertEqual(actual, expected)
    }

    func testSecondArrayIsEmpty() {
        let myArray = [5, 6, 7]
        let alicesArray: [Int] = []
        let actual = mergeArrays(myArray, alicesArray)
        let expected = [5, 6, 7]
        XCTAssertEqual(actual, expected)
    }

    func testBothArraysHaveSomeNumbers() {
        let myArray = [2, 4, 6]
        let alicesArray = [1, 3, 7]
        let actual = mergeArrays(myArray, alicesArray)
        let expected = [1, 2, 3, 4, 6, 7]
        XCTAssertEqual(actual, expected)
    }

    func testArraysAreDifferentLengths() {
        let myArray = [2, 4, 6, 8]
        let alicesArray = [1, 7]
        let actual = mergeArrays(myArray, alicesArray)
        let expected = [1, 2, 4, 6, 7, 8]
        XCTAssertEqual(actual, expected)
    }

    static let allTests = [
        ("testBothArraysAreEmpty", testBothArraysAreEmpty),
        ("testFirstArrayIsEmpty", testFirstArrayIsEmpty),
        ("testSecondArrayIsEmpty", testSecondArrayIsEmpty),
        ("testBothArraysHaveSomeNumbers", testBothArraysHaveSomeNumbers),
        ("testArraysAreDifferentLengths", testArraysAreDifferentLengths)
    ]
}

Tests.defaultTestSuite.run()
