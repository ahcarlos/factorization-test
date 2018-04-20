def perfect_square?(input)
  closest = Math.sqrt(input).ceil
  return true if input == closest * closest
end

def fermat(num)
  a = Math.sqrt(num).ceil
  b2 = a**2 - num

  loop do
    a += 1
    b2 = a**2 - num
    break if perfect_square?(b2)
  end

  fac1 = a - Math.sqrt(b2)
  fac2 = a + Math.sqrt(b2)
  [fac1.round, fac2.round]
end

 r1 = fermat(864)
 p r1
