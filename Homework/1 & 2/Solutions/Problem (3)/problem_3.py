# -*- coding: utf-8 -*-
"""
Created on Tue Sep 15 12:32:03 2020

@author: sdatta8
"""
import numpy as np

def problem_3(a,b):
    a = np.array(a)
    b = np.array(b)
    # Setting v1 equal to a
    v1 = a;
    
    # Calculating (a.b)/|a|^2, which is a scalar quantity
    scalar = a.T @ b / ( a.T @ a );
    
    # Finding the direction vector 'vec' along v2 
    vec = b - scalar * a;
    
    # Finding the value of c, that ensures |v2|=|b|
    c = np.sqrt (b.T @ b)/ np.sqrt (vec.T @ vec);
    
    # Finally calculating v2 
    v2 = c * vec;
    
    return v1, v2
