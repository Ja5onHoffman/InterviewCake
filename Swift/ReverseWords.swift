
// Mine
func reverseWords(_ message: inout [Character]) {
    
    if message.isEmpty { return }

    var splitWords: Array = message.split(separator: " ")
    for i in 0..<splitWords.count {
        
        let c = splitWords.count - 1
        if i == c - i && splitWords.count != 2 {
            break
        }
        
        let t = splitWords[i]
        splitWords[i] = splitWords[c - i]
        splitWords[c - i] = t
    }
    
    message = Array(splitWords.joined(separator: " "))
}

// Theirs
func reverseCharacters(_ str: inout [Character], from startIndex: Int, until endIndex: Int) {

    guard str.count > 0 else {
        return
    }

    var leftIndex  = startIndex
    var rightIndex = endIndex - 1

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

func reverseWords(_ message: inout [Character]) {

    // first we reverse all the characters in the message
    reverseCharacters(&message, from: message.startIndex, until: message.endIndex)

    // this gives us the right word order
    // but with each word backward
    // now we'll make the words forward again
    // by reversing each word's characters

    // we hold the index of the *start* of the current word
    // as we look for the *end* of the current word
    var currentWordStartIndex = message.startIndex
    for i in message.indices {

        // found the end of the current word!
        if message[i] == " " {

            // the next word's start is one character ahead
            reverseCharacters(&message, from: currentWordStartIndex, until: i)
            currentWordStartIndex = message.index(after: i)
        }
    }

    // now we just need to reverse the last word
    reverseCharacters(&message, from: currentWordStartIndex, until: message.endIndex)
}
















// tests

import XCTest

class Tests: XCTestCase {

    func testOneWord() {
        let expected = Array("vault")
        var actual = Array("vault")
        reverseWords(&actual)
        XCTAssertEqual(actual, expected)
    }

    func testTwoWords() {
        let expected = Array("cake thief")
        var actual = Array("thief cake")
        reverseWords(&actual)
        XCTAssertEqual(actual, expected)
    }

    func testThreeWords() {
        let expected = Array("get another one")
        var actual = Array("one another get")
        reverseWords(&actual)
        XCTAssertEqual(actual, expected)
    }

    func testMultipleWordsSameLength() {
        let expected = Array("the cat ate the rat")
        var actual = Array("rat the ate cat the")
        reverseWords(&actual)
        XCTAssertEqual(actual, expected)
    }

    func testMultipleWordsDifferentLengths() {
        let expected = Array("chocolate bundt cake is yummy")
        var actual = Array("yummy is cake bundt chocolate")
        reverseWords(&actual)
        XCTAssertEqual(actual, expected)
    }

    func testEmptyString() {
        let expected = Array("")
        var actual = Array("")
        reverseWords(&actual)
        XCTAssertEqual(actual, expected)
    }

    static let allTests = [
        ("testOneWord", testOneWord),
        ("testTwoWords", testTwoWords),
        ("testThreeWords", testThreeWords),
        ("testMultipleWordsSameLength", testMultipleWordsSameLength),
        ("testMultipleWordsDifferentLengths", testMultipleWordsDifferentLengths),
        ("testEmptyString", testEmptyString)
    ]
}

XCTMain([testCase(Tests.allTests)])