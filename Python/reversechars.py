import unittest


# def reverse(list_of_chars):
#     # Reverse the input list of chars in place
#     if len(list_of_chars) > 1:
#         l = len(list_of_chars) - 1
#         i = 0
#         while i < l:
#             temp = list_of_chars[l]
#             list_of_chars[l] = list_of_chars[i]
#             list_of_chars[i] = temp
#             l -= 1
#             i += 1
#     pass

def reverse(list_of_chars):
    if len(list_of_chars) > 1:
        l = len(list_of_chars) - 1
        i = 0
    else:
        return list_of_chars
        
    while i < l:
        temp = list_of_chars[i]
        list_of_chars[i] = list_of_chars[l]
        list_of_chars[l] = temp
        i +=1
        l -=1
    
    return list_of_chars
        # Can also do this
        # list_of_chars[left_index], list_of_chars[right_index] = \
        #     list_of_chars[right_index], list_of_chars[left_index]


# Interview Cake Answer
def reverse(list_of_chars):

    left_index  = 0
    right_index = len(list_of_chars) - 1

    while left_index < right_index:
        # Swap characters
        list_of_chars[left_index], list_of_chars[right_index] = list_of_chars[right_index], list_of_chars[left_index]
        # Move towards middle
        left_index  += 1
        right_index -= 1

# Tests

class Test(unittest.TestCase):

    def test_empty_string(self):
        list_of_chars = []
        reverse(list_of_chars)
        expected = []
        self.assertEqual(list_of_chars, expected)

    def test_single_character_string(self):
        list_of_chars = ['A']
        reverse(list_of_chars)
        expected = ['A']
        self.assertEqual(list_of_chars, expected)

    def test_longer_string(self):
        list_of_chars = ['A', 'B', 'C', 'D', 'E']
        reverse(list_of_chars)
        expected = ['E', 'D', 'C', 'B', 'A']
        self.assertEqual(list_of_chars, expected)


unittest.main(verbosity=2)