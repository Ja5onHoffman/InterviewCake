import unittest


# simpler version but uses more space because recursive
# def is_single_riffle(half1, half2, shuffled_deck):
#     if len(shuffled_deck) == 0:
#         return True
#     if len(half1) and half1[0] == shuffled_deck[0]:
#         return is_single_riffle(half1[1:], half2, shuffled_deck[1:])
#     elif len(half2) and half2[0] == shuffled_deck[0]:
#         return is_single_riffle(half1, half2[1:], shuffled_deck[1:])  
#     else:
#         return False

# O(n) time version because not recursive and keeps track of indexes
# instead of slicing
def is_single_riffle(half1, half2, shuffled_deck):
    h1Index = 0
    h2Index = 0
    
    for card in shuffled_deck:
        if h1Index < len(half1) and card == half1[h1Index]:
            h1Index += 1
        elif h2Index < len(half2) and card == half2[h2Index]:
            h2Index += 1
        else:
            return False
            
    return True

















# Tests

class Test(unittest.TestCase):

    def test_both_halves_are_the_same_length(self):
        result = is_single_riffle([1, 4, 5], [2, 3, 6], [1, 2, 3, 4, 5, 6])
        self.assertTrue(result)

    def test_halves_are_different_lengths(self):
        result = is_single_riffle([1, 5], [2, 3, 6], [1, 2, 6, 3, 5])
        self.assertFalse(result)

    def test_one_half_is_empty(self):
        result = is_single_riffle([], [2, 3, 6], [2, 3, 6])
        self.assertTrue(result)

    def test_shuffled_deck_is_missing_cards(self):
        result = is_single_riffle([1, 5], [2, 3, 6], [1, 6, 3, 5])
        self.assertFalse(result)

    def test_shuffled_deck_has_extra_cards(self):
        result = is_single_riffle([1, 5], [2, 3, 6], [1, 2, 3, 5, 6, 8])
        self.assertFalse(result)


unittest.main(verbosity=2)