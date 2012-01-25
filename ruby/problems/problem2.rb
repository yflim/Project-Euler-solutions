# By considering the terms in the Fibonacci sequence whose values 
# do not exceed four million, find the sum of the even-valued terms.

# The even-valued terms are F(3), F(6), F(9), ...
# Let f(i) = F(3i), and p(i) = F(3i - 1). 
# The problem is solved using the recurrence:
# f(i) = 3f(i-1) + 4f(i-2) + 2p(i-2), where p(i) = 2f(i-1) + p(i-1)
# and f(1) = F(3) = 2, f(2) = F(6) = 8, and p(1) = 1

def solve_problem
  max = 4000000
  f_curr = 8
  f_prev = 2
  p_curr = 1
  sum = f_prev 
  while f_curr <= max
    sum += f_curr
    temp = f_curr
    f_curr = 3*f_curr + 4*f_prev + 2*p_curr
    p_curr = 2*f_prev + p_curr
    f_prev = temp
  end
  return sum
end

puts solve_problem