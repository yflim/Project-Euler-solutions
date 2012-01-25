class SieveOfEratosthenes
  
  def self.sieve_up_to(max)
    max_sqrt = Math.sqrt(max)
    primes = [2]
    unsieved = []
    (3..max).step(2) { |i| unsieved << i }
    curr_prime = unsieved[0]
    while curr_prime <= max_sqrt
      curr_sqr_idx = unsieved.index(curr_prime ** 2)
      primes.push(unsieved.delete_at(0))
      unsieved.select!{ |i| i % curr_prime != 0 }
      curr_prime = unsieved[0]
    end
    primes.concat(unsieved)
    return primes
  end
  
  def initialize(max)
    @max = max
    @unsieved = [2]
    (3..max).step(2) { |i| @unsieved << i }
  end

  def sieve_all
    i = 1
    while i < @unsieved.length
      curr = @unsieved[i]
      curr_sqr = curr ** 2
      @unsieved.select!{ |i| i < curr_sqr || i % curr != 0 }
      i += 1
    end
    @primes = @unsieved.dup
  end
    
  def get_next_prime(*preceding)
    sieve_all unless @primes
    if preceding.length > 0
      get_next_prime_given_preceding(@primes, preceding[0])
    else
      @last_returned = 
        @last_returned ? 
        get_next_prime_given_preceding(@primes, @last_returned) : 2               
    end
  end     

  private
  
  def self.not_multiple_of(primes, num)
    primes.each do |p|
      return false if num % p == 0
    end
    return true
  end
  
  def get_next_prime_given_preceding(primes, preceding)
    if prev_index = primes.index(preceding)
      primes[prev_index + 1]
    else
      primes[primes.index{ |i| i > preceding }]
    end
  end
  
  # not currently needed
  def reset_max(new_max)
    if new_max > @max
      increase_max(new_max)
    elsif new_max < @max
      decrease_max(new_max)
    end
  end
  
  # to be fleshed out if necessary
  def increase_max(new_max)
  end
  
  # to be fleshed out if necessary
  def decrease_max(new_max)
  end
  
end