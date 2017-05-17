# CRIBA DE ERASTOSTENES
# https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
def sieve_of_erastosthenes(num)
  s = Array.new(num, 0)
  for index in 1...s.length
    s[index] = 1
  end
  mul = 2
  while mul**2 <= num
    for prime in (mul..(num / mul))
      s[mul * prime] = 0
    end

    loop do
      mul += 1
      break if s[mul] == 1
    end
  end
  final = []
  for index in 2..s.length
    final.push(index) if s[index] == 1
  end
  final
end

def factorizar(number)
  res = []
  prime_factors_in_range = sieve_of_erastosthenes(number)
  for it in 0...prime_factors_in_range.length
    loop do
      if number % prime_factors_in_range[it] == 0
        res.push(prime_factors_in_range[it])
        number /= prime_factors_in_range[it]
      else
        break
        end
    end
  end
  res
end

def print_decomposition(number, decomp)
  counter = []
  decomp.uniq.each { |x| counter.push(decomp.count(x)) }
  unique_values = decomp.uniq
  text = "#{number} = "
  for it in (0...unique_values.length)
    text << "#{unique_values[it]} ^ #{counter[it]}"
    text << ' * ' if it != unique_values.length - 1
  end
  text
end

input = 5959
decomp = factorizar(input)
puts "Prime factors are #{decomp.join(', ')}"
puts "Sum of the prime factors -> #{decomp.inject(0, :+)}"
decomposition_text = print_decomposition(input, decomp)
puts "Decomposition is -> #{decomposition_text}"
