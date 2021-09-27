// Mine
func getMaxProfit(from stockPricesYesterday: [Int]) -> Int? {
    
    if stockPricesYesterday.count == 0 || stockPricesYesterday.count == 1 {
        return nil
    }
    
    var profit = stockPricesYesterday[1] - stockPricesYesterday[0]
    var min = stockPricesYesterday[0]
    
    for i in 1..<stockPricesYesterday.count {
        let dif = stockPricesYesterday[i] - min
        if dif > profit {
            profit = dif
        }
        
        if stockPricesYesterday[i] < min {
            min = stockPricesYesterday[i]
        }
    }
    
    return profit
}

// Theirs
  func getMaxProfit(from stockPricesYesterday: [Int]) -> Int? {

    guard stockPricesYesterday.count >= 2 else {
        return nil
    }

    // we'll greedily update minPrice and maxProfit, so we initialize
    // them to the first price and the first possible profit
    var minPrice  = stockPricesYesterday[0]
    var maxProfit = stockPricesYesterday[1] - stockPricesYesterday[0]

    // start at the second (index 1) time
    // we can't sell at the first time, since we must buy first,
    // and we can't buy and sell at the same time!
    // if we started at index 0, we'd try to buy *and* sell at time 0.
    // this would give a profit of 0, which is a problem if our
    // maxProfit is supposed to be *negative*--we'd return 0.
    for currentPrice in stockPricesYesterday[1...] {

        // see what our profit would be if we bought at the
        // min price and sold at the current price
        let potentialProfit = currentPrice - minPrice

        // update maxProfit if we can do better
        maxProfit = max(maxProfit, potentialProfit)

        // update minPrice so it's always
        // the lowest price we've seen so far
        minPrice = min(minPrice, currentPrice)
    }

    return maxProfit
}


















// tests

import XCTest

class Tests: XCTestCase {

    func testPriceGoesUpThenDown() {
        let actual = getMaxProfit(from: [1, 5, 3, 2])
        let expected = 4
        XCTAssertEqual(actual, expected)
    }

    func testPriceGoesDownThenUp() {
        let actual = getMaxProfit(from: [7, 2, 8, 9])
        let expected = 7
        XCTAssertEqual(actual, expected)
    }

    func testBigIncreaseThenSmallIncrease() {
        let actual = getMaxProfit(from: [2, 10, 1, 4])
        let expected = 8
        XCTAssertEqual(actual, expected)
    }

    func testPriceGoesUpAllDay() {
        let actual = getMaxProfit(from: [1, 6, 7, 9])
        let expected = 8
        XCTAssertEqual(actual, expected)
    }

    func testPriceGoesDownAllDay() {
        let actual = getMaxProfit(from: [9, 7, 4, 1])
        let expected = -2
        XCTAssertEqual(actual, expected)
    }

    func testPriceStaysTheSameAllDay() {
        let actual = getMaxProfit(from: [1, 1, 1, 1])
        let expected = 0
        XCTAssertEqual(actual, expected)
    }

    func testReturnNilWithEmptyPrices() {
        let actual = getMaxProfit(from: [])
        XCTAssertNil(actual)
    }

    func testReturnNillWithOnePrice() {
        let actual = getMaxProfit(from: [1])
        XCTAssertNil(actual)
    }

    static let allTests = [
        ("testPriceGoesUpThenDown", testPriceGoesUpThenDown),
        ("testPriceGoesDownThenUp", testPriceGoesDownThenUp),
        ("testBigIncreaseThenSmallIncrease", testBigIncreaseThenSmallIncrease),
        ("testPriceGoesUpAllDay", testPriceGoesUpAllDay),
        ("testPriceGoesDownAllDay", testPriceGoesDownAllDay),
        ("testPriceStaysTheSameAllDay", testPriceStaysTheSameAllDay),
        ("testReturnNilWithEmptyPrices", testReturnNilWithEmptyPrices),
        ("testReturnNillWithOnePrice", testReturnNillWithOnePrice)
    ]
}

XCTMain([testCase(Tests.allTests)])