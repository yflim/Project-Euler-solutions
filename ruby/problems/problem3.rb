# Code (in sieve_of_eratosthenes.rb) is still way too slow. 
# Should try another language maybe.
require_relative '../lib/sieve_of_eratosthenes'

# What is the largest prime factor of the number 600851475143?

def largest_factor_of(max)
  primes = SieveOfEratosthenes.sieve_up_to(max)
  primes.at(primes.rindex{ |i| max % i == 0 })
end

puts largest_factor_of(13195)
puts largest_factor_of(600851475143)