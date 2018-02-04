#!/usr/bin/env ruby
limit = 10000

prime_list = -> (num) {
  result = []
  list = Range.new(2, num).to_a
  while Math.sqrt(num) > list.first do
    current = list.shift
    result << current
    list = list.select { |v| (v % current) > 0 }
  end
  result + list
}

printf("%d\n", prime_list.call(limit).length)
