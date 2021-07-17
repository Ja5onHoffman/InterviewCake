
// Mine O(n^2)
func canTwoMovies(in movieLengths: [Int], fillFlight flightLength: Int) -> Bool {


    for i in 0..<movieLengths.count {
        let len = flightLength - movieLengths[i]
        for j in i+1..<movieLengths.count {
            if movieLengths[j] == len { return true }
        }
    }

    return false
}


// Theirs (set can lookup in O(1), so O(n) w the loop
func canTwoMovies(in movieLengths: [Int], fillFlight flightLength: Int) -> Bool {

  // movie lengths we've seen so far
  var movieLengthsSeen = Set<Int>()

  for firstMovieLength in movieLengths {
      let matchingSecondMovieLength = flightLength - firstMovieLength
      if movieLengthsSeen.contains(matchingSecondMovieLength) {
          return true
      }

      movieLengthsSeen.insert(firstMovieLength)
  }

  // we never found a match, so return false
  return false
}


// tests

import XCTest

class Tests: XCTestCase {

    func testShortFlight() {
        let result = canTwoMovies(in: [2, 4], fillFlight: 1)
        XCTAssertFalse(result)
    }

    func testLongFlight() {
        let result = canTwoMovies(in: [2, 4], fillFlight: 6)
        XCTAssertTrue(result)
    }

    func testOneMovieHalfFlightLength() {
        let result = canTwoMovies(in: [3, 8], fillFlight: 6)
        XCTAssertFalse(result)
    }

    func testTwoMoviesHalfFlightLength() {
        let result = canTwoMovies(in: [3, 8, 3], fillFlight: 6)
        XCTAssertTrue(result)
    }

    func testLotsOfPossiblePairs() {
        let result = canTwoMovies(in: [1, 2, 3, 4, 5, 6], fillFlight: 7)
        XCTAssertTrue(result)
    }

    func testNotUsingFirstMovie() {
        let result = canTwoMovies(in: [4, 3, 2], fillFlight: 5)
        XCTAssertTrue(result)
    }

    func testMultipleMoviesShorterThanFlight() {
        let result = canTwoMovies(in: [5, 6, 7, 8], fillFlight: 9)
        XCTAssertFalse(result)
    }

    func testOnlyOneMovie() {
        let result = canTwoMovies(in: [6], fillFlight: 6)
        XCTAssertFalse(result)
    }

    func testNoMovies() {
        let result = canTwoMovies(in: [], fillFlight: 2)
        XCTAssertFalse(result)
    }

    static let allTests = [
        ("testShortFlight", testShortFlight),
        ("testLongFlight", testLongFlight),
        ("testOneMovieHalfFlightLength", testOneMovieHalfFlightLength),
        ("testTwoMoviesHalfFlightLength",testTwoMoviesHalfFlightLength),
        ("testLotsOfPossiblePairs", testLotsOfPossiblePairs),
        ("testNotUsingFirstMovie", testNotUsingFirstMovie),
        ("testMultipleMoviesShorterThanFlight", testMultipleMoviesShorterThanFlight),
        ("testOnlyOneMovie", testOnlyOneMovie),
        ("testNoMovies", testNoMovies)
    ]
}

Tests.defaultTestSuite.run()
