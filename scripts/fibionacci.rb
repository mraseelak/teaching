#! /usr/bin/env ruby

raise "Please provide a number" if ARGV.size == 0
number = ARGV[0].to_i


def fibionacci(num)
  return 0 if num == 0
  return 1 if num <= 2
  
  fibionacci(num - 1) + fibionacci(num - 2)
  
end


def fibionacci_iterative(num)
  puts "Presenting fibonacci in iterative (fibionacci_iterative)"
  previous = 0
  current = 1
  puts previous
  (0..(num - 2)).each do 
  	puts current
  	sum = previous + current
  	previous = current
  	current = sum  	
  end
end

# This section of the script will generate the fibionacci series up to the number provided. 
def fib_up_to(num)
  puts "Presenting Fibonacci series up to #{num} elements (fib_up_to)"


  (0...num).each { |n| puts fibionacci(n) }
end

def fib_less_than(num)
  puts "Presenting Fibonacci series where value is less than #{num} (fib_less_than)"
  
  flag = true
  i = 0
  while flag
    puts fibionacci(i)
    i += 1
    flag = false if fibionacci(i) > num
  end
end

fibionacci_iterative(number)

fib_up_to(number)

fib_less_than(number)