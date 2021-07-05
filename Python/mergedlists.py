import unittest

def merge_lists(my_list, alices_list):
    # Set up our merged_list
    merged_size = len(my_list) + len(alices_list)
    merged_list = [None] * (len(my_list) + len(alices_list))
    
    cur_alice = 0
    cur_my = 0
    cur_merged = 0
    while cur_merged < merged_size:
        is_my_list_exhausted = cur_my >= len(my_list)
        is_alices_list_exhausted = cur_alice >= len(alices_list)
        if (not is_my_list_exhausted and (is_alices_list_exhausted or my_list[cur_my] < alices_list[cur_alice])):
            merged_list[cur_merged] = my_list[cur_my]
            cur_my += 1
        else:
            merged_list[cur_merged] = alices_list[cur_alice]
            cur_alice += 1
        
        cur_merged += 1
    
    # actually fast for smaller input sizes
    # merged_list = sorted(my_list + alices_list)
    return merged_list

        




# Tests

class Test(unittest.TestCase):

    def test_both_lists_are_empty(self):
        actual = merge_lists([], [])
        expected = []
        self.assertEqual(actual, expected)

    def test_first_list_is_empty(self):
        actual = merge_lists([], [1, 2, 3])
        expected = [1, 2, 3]
        self.assertEqual(actual, expected)

    def test_second_list_is_empty(self):
        actual = merge_lists([5, 6, 7], [])
        expected = [5, 6, 7]
        self.assertEqual(actual, expected)

    def test_both_lists_have_some_numbers(self):
        actual = merge_lists([2, 4, 6], [1, 3, 7])
        expected = [1, 2, 3, 4, 6, 7]
        self.assertEqual(actual, expected)

    def test_lists_are_different_lengths(self):
        actual = merge_lists([2, 4, 6, 8], [1, 7])
        expected = [1, 2, 4, 6, 7, 8]
        self.assertEqual(actual, expected)


unittest.main(verbosity=2)