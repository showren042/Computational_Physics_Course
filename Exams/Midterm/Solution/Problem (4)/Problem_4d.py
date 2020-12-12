# -*- coding: utf-8 -*-
"""
Created on Thu Oct 22 20:03:21 2020

@author: sdatta8
"""
import numpy as np                        #import numpy for arrays
import time

n = [10, 20, 50, 100, 200, 500, 1000, 2000]

t = np.zeros(np.size(n))

for i in np.arange(0,np.size(n)):

    start = time.time()

    A = (np.ones(n[i]) + np.eye(n[i])) / (n[i] + 1)
    
    logarithm_A = np.zeros(n[i])
    base_mat = np.eye(n[i]) - A
    k = 1
    eps = np.finfo(np.float64).eps
    
    while (np.mean(np.abs((1 / k ) * base_mat)) > eps):
        logarithm_A = logarithm_A - (1 / k ) * base_mat
        base_mat = base_mat @ (np.eye(n[i]) - A)
        k = k + 1

    end = time.time()
    t[i] = (end - start)
    print(n[i])