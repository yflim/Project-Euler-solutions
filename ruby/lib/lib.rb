def sum_of_range(min, max)
  raise ArgumentError if min < 0 || max < 0 || min > max
  return (min + max) * (max - min + 1) / 2
end
