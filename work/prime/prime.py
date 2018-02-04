#!/usr/bin/env python
import math
limit = 10000

def prime_list(num):
   result = []
   tmp_list = list(range(2, num))
   while math.sqrt(num) > tmp_list[0]:
      current = tmp_list.pop(0)
      result.append(current)
      tmp_list = [v for v in tmp_list if (v % current) > 0]

   return result + tmp_list


print("%d" % len(prime_list(limit)))
