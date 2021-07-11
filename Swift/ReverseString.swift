// Mine
func reverse(_ str: inout [Character]) {

    for i in 0..<str.count {
        let c = str.count - 1
        if i == c - i {
            break
        }
        let t = str[i]
        str[i] = str[c - i]
        str[c - i] = t
    }
}

// Theirs
func reverse(_ str: inout [Character]) {

    guard str.count > 0 else {
        return
    }

    var leftIndex  = 0
    var rightIndex = str.count - 1

    while leftIndex < rightIndex {

        // swap characters
        let leftChar  = str[leftIndex]
        let rightChar = str[rightIndex]

        str[leftIndex] = rightChar
        str[rightIndex] = leftChar

        // move towards middle
        leftIndex  += 1
        rightIndex -= 1
    }
}



// tests

import XCTest

class Tests: XCTestCase {

    func testEmptyString() {
        var actual = Array("")
        let expected = Array("")
        reverse(&actual)
        XCTAssertEqual(actual, expected)
    }

    func testSingleCharacterString() {
        var actual = Array("A")
        let expected = Array("A")
        reverse(&actual)
        XCTAssertEqual(actual, expected)
    }

    func testLongerString() {
        var actual = Array("ABCDE")
        let expected = Array("EDCBA")
        reverse(&actual)
        XCTAssertEqual(actual, expected)
    }

    static let allTests = [
        ("testEmptyString", testEmptyString),
        ("testSingleCharacterString", testSingleCharacterString),
        ("testLongerString", testLongerString)
    ]
}

XCTMain([testCase(Tests.allTests)])