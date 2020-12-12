# -*- coding: utf-8 -*-
"""
Created on Thu Oct 22 19:23:14 2020

@author: sdatta8
"""

import numpy as np                        #import numpy for arrays

n = 10

A = (np.ones(n) + np.eye(n)) / (n + 1)

logarithm_A = np.zeros(n)
base_mat = np.eye(n) - A
k = 1
eps = np.finfo(np.float64).eps
 
while (np.mean(np.abs(base_mat/k)) > eps):
    logarithm_A = logarithm_A - (1 / k ) * base_mat
    base_mat = base_mat @ (np.eye(n) - A)
    k = k + 1
    
np.savetxt('logarithm_A_python.txt',logarithm_A,fmt='%1.8f',delimiter='  ')