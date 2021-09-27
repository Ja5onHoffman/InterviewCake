import Foundation

// Mine
func getProductsOfAllIntsExceptAtIndex(_ ints: [Int]) -> [Int]? {

   if ints.count < 2 { return nil }

   var res = [Int]()
   // O(n)
   for i in 0..<ints.count {
       var p = ints
       // O(n)
       p.remove(at: i)
       // O(n)
       res.append(p.reduce(1) {
           $0 * $1
       })
   }

   return res
}


// Theirs
func getProductsOfAllIntsExceptAtIndex(_ ints: [Int]) -> [Int]? {

    guard ints.count >= 2 else {
        return nil
    }

    // we make an array with the length of the input array to
    // hold our products
    var productsOfAllIntsExceptAtIndex = Array(repeating: 0, count: ints.count)

    // for each integer, we find the product of all the integers
    // before it, storing the total product so far each time
    var productSoFar = 1
    for i in 0..<ints.count {
        productsOfAllIntsExceptAtIndex[i] = productSoFar
        productSoFar *= ints[i]
    }

    // for each integer, we find the product of all the integers
    // after it. since each index in products already has the
    // product of all the integers before it, now we're storing
    // the total product of all other integers
    productSoFar = 1
    for i in (0..<ints.count).reversed() {
        productsOfAllIntsExceptAtIndex[i] *= productSoFar
        productSoFar *= ints[i]
    }

    return productsOfAllIntsExceptAtIndex
}


getProductsOfAllIntsExceptAtIndex([1,2,3])


// tests

import XCTest

class Tests: XCTestCase {

   func testSmallArray() {
       let actual = getProductsOfAllIntsExceptAtIndex([1, 2, 3])
       let expected = [6, 3, 2]
       assertArraysEqual(actual, expected)
   }

   func testLongerArray() {
       let actual = getProductsOfAllIntsExceptAtIndex([8, 2, 4, 3, 1, 5])
       let expected = [120, 480, 240, 320, 960, 192]
       assertArraysEqual(actual, expected)
   }

   func testArrayHasOneZero() {
       let actual = getProductsOfAllIntsExceptAtIndex([6, 2, 0, 3])
       let expected = [0, 0, 36, 0]
       assertArraysEqual(actual, expected)
   }

   func testArrayHasTwoZeros() {
       let actual = getProductsOfAllIntsExceptAtIndex([4, 0, 9, 1, 0])
       let expected = [0, 0, 0, 0, 0]
       assertArraysEqual(actual, expected)
   }

   func testOneNegativeNumber() {
       let actual = getProductsOfAllIntsExceptAtIndex([-3, 8, 4])
       let expected = [32, -12, -24]
       assertArraysEqual(actual, expected)
   }

   func testAllNegativeNumbers() {
       let actual = getProductsOfAllIntsExceptAtIndex([-7, -1, -4, -2])
       let expected = [-8, -56, -14, -28]
       assertArraysEqual(actual, expected)
   }

   func testErrorWithEmptyArray() {
       let actual = getProductsOfAllIntsExceptAtIndex([])
       XCTAssertNil(actual)
   }

   func testErrorWithOneNumber() {
       let actual = getProductsOfAllIntsExceptAtIndex([1])
       XCTAssertNil(actual)
   }

   static let allTests = [
       ("testSmallArray", testSmallArray),
       ("testLongerArray", testLongerArray),
       ("testArrayHasOneZero", testArrayHasOneZero),
       ("testArrayHasTwoZeros", testArrayHasTwoZeros),
       ("testOneNegativeNumber", testOneNegativeNumber),
       ("testAllNegativeNumbers", testAllNegativeNumbers),
       ("testErrorWithEmptyArray", testErrorWithEmptyArray),
       ("testErrorWithOneNumber", testErrorWithOneNumber)
   ]
}

func assertArraysEqual(_ actual: [Int]?, _ expected: [Int]) {
   if let actual = actual {
       XCTAssertEqual(actual, expected)
   } else {
       XCTFail("actual is nil")
   }
}

Tests.defaultTestSuite.run()
