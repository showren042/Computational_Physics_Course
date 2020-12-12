# -*- coding: utf-8 -*-
"""
Created on Tue Sep 15 12:03:24 2020

@author: sdatta8
"""
import numpy as np

# Initialization
x_1 = np.array([1], dtype=np.int64)
product_int = x_1
counter_int = int(0)

x_2 = np.array([1], dtype=np.float64)
product_float = x_2
counter_float = int(0)

# Running iterations to find the largest functionable power of 2
while product_int > 0:
    print(counter_int,product_int)
    product_int = product_int * 2       # multiplying 2 in each iteration
    counter_int = counter_int + 1       # increment in iteration counter 

# Subtracting 1 as the final iteration leads to unstability
stable_counter_int = counter_int - 1

# Printing the iteration number after which something goes wrong
print(stable_counter_int)


# Running iterations to find the largest functionable power of 2
while product_float < np.inf:
    print(counter_float,product_float)
    product_float = product_float * 2.0  # multiplying 2 in each iteration
    counter_float = counter_float + 1    # increment in iteration counter
    
# Subtracting 1 as the final iteration leads to unstability
stable_counter_float = counter_float - 1

# Printing the iteration number after which something goes wrong
print(stable_counter_float)