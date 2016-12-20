require 'set'

def sum_of_range(min, max)
  raise ArgumentError if min < 0 || max < 0 || min > max
  return (min + max) * (max - min + 1) / 2
end

# brutto ma buono?: ugly but hopefully good (fast(er))
# https://en.wikipedia.org/wiki/Bruttiboni
def factorize(num)
  primes_lteq = SieveOfEratosthenes.sieve_up_to(num)
  primes_lteq_set = SortedSet.new(primes_lteq) # because bsearch can't handle equality?!?
  factors_to_exps = {}
  i = 0
  fnum = num * 1.0
  while !(primes_lteq_set.include?(num))
    complement = fnum / primes_lteq[i]
    complement_flr = complement.floor
    if complement == complement_flr
      factors_to_exps[primes_lteq[i]] = 1
      fnum = complement
      num = complement_flr
      while !(primes_lteq_set.include?(num))
        complement = fnum / primes_lteq[i]
        complement_flr = complement.floor
        break if complement != complement_flr
        factors_to_exps[primes_lteq[i]] += 1
        fnum = complement
        num = complement_flr
      end
    end
    i += 1
  end
  factors_to_exps[num] = factors_to_exps[num] ? factors_to_exps[num] + 1 : 1
  return factors_to_exps
end
