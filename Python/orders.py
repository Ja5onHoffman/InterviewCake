import unittest

#ends up being close to their solution

def is_first_come_first_served(take_out_orders, dine_in_orders, served_orders):

    # Check if we're serving orders first-come, first-served
    ti = 0
    di = 0
    si = 0
    
    while si < len(served_orders):
        if len(take_out_orders) > 0 and served_orders[si] == take_out_orders[ti]:
            if (ti + 1) < len(take_out_orders):
                ti += 1
            si += 1
        elif len(dine_in_orders) > 0 and served_orders[si] == dine_in_orders[di]:
            if (di + 1) < len(dine_in_orders):
                di += 1
            si += 1
        else:
            return False

    return True



# Recursive solution
#   def is_first_come_first_served(take_out_orders, dine_in_orders, served_orders):
#     # Base case
#     if len(served_orders) == 0:
#         return True

#     # If the first order in served_orders is the same as the
#     # first order in take_out_orders
#     # (making sure first that we have an order in take_out_orders)
#     if len(take_out_orders) and take_out_orders[0] == served_orders[0]:
#         # Take the first order off take_out_orders and served_orders and recurse
#         return is_first_come_first_served(take_out_orders[1:], dine_in_orders, served_orders[1:])

#     # If the first order in served_orders is the same as the first
#     # in dine_in_orders
#     elif len(dine_in_orders) and dine_in_orders[0] == served_orders[0]:
#         # Take the first order off dine_in_orders and served_orders and recurse
#         return is_first_come_first_served(take_out_orders, dine_in_orders[1:], served_orders[1:])

#     # First order in served_orders doesn't match the first in
#     # take_out_orders or dine_in_orders, so we know it's not first-come, first-served
#     else:
#         return False


# Tests

class Test(unittest.TestCase):

    def test_both_registers_have_same_number_of_orders(self):
        result = is_first_come_first_served([1, 4, 5], [2, 3, 6], [1, 2, 3, 4, 5, 6])
        self.assertTrue(result)

    def test_registers_have_different_lengths(self):
        result = is_first_come_first_served([1, 5], [2, 3, 6], [1, 2, 6, 3, 5])
        self.assertFalse(result)

    def test_one_register_is_empty(self):
        result = is_first_come_first_served([], [2, 3, 6], [2, 3, 6])
        self.assertTrue(result)

    def test_served_orders_is_missing_orders(self):
        result = is_first_come_first_served([1, 5], [2, 3, 6], [1, 6, 3, 5])
        self.assertFalse(result)

    def test_served_orders_has_extra_orders(self):
        result = is_first_come_first_served([1, 5], [2, 3, 6], [1, 2, 3, 5, 6, 8])
        self.assertFalse(result)

    def test_one_register_has_extra_orders(self):
        result = is_first_come_first_served([1, 9], [7, 8], [1, 7, 8])
        self.assertFalse(result)

    def test_one_register_has_unserved_orders(self):
        result = is_first_come_first_served([55, 9], [7, 8], [1, 7, 8, 9])
        self.assertFalse(result)

    def test_order_numbers_are_not_sequential(self):
        result = is_first_come_first_served([27, 12, 18], [55, 31, 8], [55, 31, 8, 27, 12, 18])
        self.assertTrue(result)


unittest.main(verbosity=2)