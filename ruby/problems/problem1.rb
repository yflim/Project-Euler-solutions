require_relative '../lib/lib'

# Add all the natural numbers below 1000 that are multiples of 3 or 5.

def largest_multiple_under(upper_bound, multiplicand)
  multiple = upper_bound - 1
  while multiple % multiplicand > 0
    multiple = multiple - 1
  end
  return multiple
end

def solve_problem
  multiplier_of_3 = largest_multiple_under(1000, 3) / 3
  multiplier_of_5 = largest_multiple_under(1000, 5) / 5
  overlap = 3 * 5
  multiplier_of_overlap = largest_multiple_under(1000, overlap) / overlap
  solution = sum_of_range(1, multiplier_of_3) * 3 
  solution += sum_of_range(1, multiplier_of_5) * 5 
  solution -= sum_of_range(1, multiplier_of_overlap) * overlap
end


puts solve_problem