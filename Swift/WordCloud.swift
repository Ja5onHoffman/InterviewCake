// Mine (fails one test)
import Foundation

extension Character {
    func isLetter() -> Bool {
        return "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".contains(self)
    }
}

class WordCloudData {

    private(set) var wordsToCounts: [String: Int] = [:]

    init(_ input: String) {
        populateWordsToCounts(input)
    }

    private func populateWordsToCounts(_ input: String) {
        var set = CharacterSet.punctuationCharacters
        set.remove("-")
        set.remove("'")
        let removed = input.components(separatedBy: set).joined().components(separatedBy: " ")

        for i in removed {
            if i.first!.isLetter {
                if wordsToCounts[String(i)] != nil {
                    wordsToCounts[String(i)]! += 1
                } else {
                    wordsToCounts[String(i)] = 1
                }
            }

        }
    }
}