#!/bin/bash
n=$1

if [ $(($n % 2)) -eq 0 ]; then 
    echo "Given number $n is even number"
else
    echo "Given number $n is odd number"
fi