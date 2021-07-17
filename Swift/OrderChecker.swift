import Foundation

// Mine 
func isFirstComeFirstServed(takeOutOrders: [Int], dineInOrders: [Int], servedOrders: [Int]) -> Bool {

    if takeOutOrders.isEmpty && dineInOrders == servedOrders { return true }
    if dineInOrders.isEmpty && takeOutOrders == servedOrders { return true }
    let max = takeOutOrders.count + dineInOrders.count
    if max < servedOrders.count || max > servedOrders.count { return false }
    
    var takeOutIndex = 0
    var dineInIndex = 0
    for j in servedOrders {
        
        if takeOutOrders.contains(j) {
            if takeOutOrders.firstIndex(of: j) == takeOutIndex {
                takeOutIndex += 1
            } else {
                return false
            }
        }
        
        if dineInOrders.contains(j) {
            if dineInOrders.firstIndex(of: j) == dineInIndex {
                dineInIndex += 1
            } else {
                return false
            }
        }
    }
    
    return true
}

// Theirs
  func isFirstComeFirstServed(takeOutOrders: [Int], dineInOrders: [Int], servedOrders: [Int]) -> Bool {
    var takeOutOrdersIndex = 0
    var dineInOrdersIndex = 0
    let takeOutOrdersMaxIndex = takeOutOrders.count - 1
    let dineInOrdersMaxIndex = dineInOrders.count - 1

    for order in servedOrders {

        // if we still have orders in takeOutOrders
        // and the current order in takeOutOrders is the same
        // as the current order in servedOrders
        if takeOutOrdersIndex <= takeOutOrdersMaxIndex && order == takeOutOrders[takeOutOrdersIndex] {
            takeOutOrdersIndex += 1

        // if we still have orders in dineInOrders
        // and the current order in dineInOrders is the same
        // as the current order in servedOrders
        } else if dineInOrdersIndex <= dineInOrdersMaxIndex && order == dineInOrders[dineInOrdersIndex] {
            dineInOrdersIndex += 1

        // if the current order in servedOrders doesn't match the current
        // order in takeOutOrders or dineInOrders, then we're not serving first-come,
        // first-served
        } else {
            return false
        }
    }

    // check for any extra orders at the end of takeOutOrders or dineInOrders
    if (dineInOrdersIndex != dineInOrders.count || takeOutOrdersIndex != takeOutOrders.count) {
        return false;
    }

    // all orders in servedOrders have been "accounted for"
    // so we're serving first-come, first-served!
    return true
}

// Their recursive
func isFirstComeFirstServed(takeOutOrders: [Int], dineInOrders: [Int], servedOrders: [Int]) -> Bool {

    // base case
    if servedOrders.count == 0 {
        return true
    }

    // if the first order in servedOrders is the same as the
    // first order in takeOutOrders
    // (making sure first that we have an order in takeOutOrders)
    if takeOutOrders.count > 0 && takeOutOrders[0] == servedOrders[0] {

        // take the first order off takeOutOrders and servedOrders and recurse
        return isFirstComeFirstServed(takeOutOrders: Array(takeOutOrders[1...]),
                                      dineInOrders: dineInOrders,
                                      servedOrders: Array(servedOrders[1...]))

    // if the first order in servedOrders is the same as the first
    // in dineInOrders
    } else if dineInOrders.count > 0 && dineInOrders[0] == servedOrders[0] {

        // take the first order off dineInOrders and servedOrders and recurse
        return isFirstComeFirstServed(takeOutOrders: takeOutOrders,
                                      dineInOrders: Array(dineInOrders[1...]),
                                      servedOrders: Array(servedOrders[1...]))

    // first order in servedOrders doesn't match the first in
    // takeOutOrders or dineInOrders, so we know it's not first-come, first-served
    } else {
        return false
    }
}


// tests

import XCTest

class Tests: XCTestCase {

    func testBothRegistersHaveSameNumberOfOrders() {
        let result = isFirstComeFirstServed(
            takeOutOrders: [1, 4, 5],
            dineInOrders: [2, 3, 6],
            servedOrders: [1, 2, 3, 4, 5, 6]
        )
        XCTAssertTrue(result)
    }

    func testRegistersHaveDifferentLengths() {
        let result = isFirstComeFirstServed(
            takeOutOrders: [1, 5],
            dineInOrders: [2, 3, 6],
            servedOrders: [1, 2, 6, 3, 5]
        )
        XCTAssertFalse(result)
    }

    func testOneRegisterIsEmpty() {
        let result = isFirstComeFirstServed(
            takeOutOrders: [],
            dineInOrders: [2, 3, 6],
            servedOrders: [2, 3, 6]
        )
        XCTAssertTrue(result)
    }

    func testServedOrdersIsMissingOrders() {
        let result = isFirstComeFirstServed(
            takeOutOrders: [1, 5],
            dineInOrders: [2, 3, 6],
            servedOrders: [1, 6, 3, 5]
        )
        XCTAssertFalse(result)
    }

    func testServedOrdersHasExtraOrders() {
        let result = isFirstComeFirstServed(
            takeOutOrders: [1, 5],
            dineInOrders: [2, 3, 6],
            servedOrders: [1, 2, 3, 5, 6, 8]
        )
        XCTAssertFalse(result)
    }

    func testOneRegisterHasExtraOrders() {
        let result = isFirstComeFirstServed(
            takeOutOrders: [1, 9],
            dineInOrders: [7, 8],
            servedOrders: [1, 7, 8]
        )
        XCTAssertFalse(result)
    }

    func testOneRegisterHasUnservedOrders() {
        let result = isFirstComeFirstServed(
            takeOutOrders: [55, 9],
            dineInOrders: [7, 8],
            servedOrders: [1, 7, 8, 9]
        )
        XCTAssertFalse(result)
    }

    func testOrderNumbersAreNotSequential() {
        let result = isFirstComeFirstServed(
            takeOutOrders: [27, 12, 18],
            dineInOrders: [55, 31, 8],
            servedOrders: [55, 31, 8, 27, 12, 18]
        )
        XCTAssertTrue(result)
    }

    static let allTests = [
        ("testBothRegistersHaveSameNumberOfOrders", testBothRegistersHaveSameNumberOfOrders),
        ("testRegistersHaveDifferentLengths", testRegistersHaveDifferentLengths),
        ("testOneRegisterIsEmpty", testOneRegisterIsEmpty),
        ("testServedOrdersIsMissingOrders", testServedOrdersIsMissingOrders),
        ("testServedOrdersHasExtraOrders", testServedOrdersHasExtraOrders),
        ("testOneRegisterHasExtraOrders", testOneRegisterHasExtraOrders),
        ("testOneRegisterHasUnservedOrders", testOneRegisterHasUnservedOrders),
        ("testOrderNumbersAreNotSequential", testOrderNumbersAreNotSequential)
    ]
}

Tests.defaultTestSuite.run()
