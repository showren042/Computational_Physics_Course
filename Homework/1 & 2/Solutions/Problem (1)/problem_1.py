# -*- coding: utf-8 -*-
"""
Created on Tue Sep 15 10:57:32 2020

@author: sdatta8
"""
import numpy as np                        #import numpy for arrays
import matplotlib.pyplot as plt
import sympy
import math
from sympy import *

# Using a symbolic function
z = symbols('z')

# Setting the given values of t and n
t = 2
n = np.arange(0,21)

# Declaring the function exact_solution
def exact_solution(t):
    return 1 / (1 + 9 * np.exp(-t))

# Finding the first derivative of the given exact solution to the logistic
# equation at t=2


x = 1 / (1 + 9 * exp(-z))

first_derivative = diff(x, z)

# Initialization
del_t = np.zeros((1,len(n)))
first_principal = np.zeros((1,len(n)))
absolute_error = np.zeros((1,len(n)))

# Running iterations for each value of 'n' and finding corresponding
# absolute error
for i in n:
    del_t[0, i] = 10.0 ** (- i)
    first_principal[0, i] \
        = (exact_solution(t + del_t[0, i]) - exact_solution(t)) / del_t[0, i]
    absolute_error[0, i] \
        = np.abs( first_derivative.evalf(subs={z:t}) - first_principal[0,i])

# Plotting the log-log graph and saving it as a png file
plt.loglog(del_t[0,:],absolute_error[0,:],'*')
plt.xlabel('$\Delta t$')
plt.ylabel('$\delta (\Delta t)$')
plt.suptitle('Absolute Error $\delta (\Delta t)$ vs $\Delta t$ for x(t) = 1 / (1 + 9 * exp(-t)) and t = 2')
plt.savefig('Problem_1_PYTHON.png')
plt.show()

