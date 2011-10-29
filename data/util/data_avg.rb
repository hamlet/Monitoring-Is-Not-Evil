#!/usr/bin/env ruby
value = 0
diff = 0
number = 0
diffmin = 1024
diffmax = 0
while a = gets
  /(\d+) (\d+) (\d+) (\d+)/.match(a) {|m|
    time = m[1].to_i
    value += m[2].to_i
d = m[4].to_i
    diff += d
    number += 1
    diffmin = d if d < diffmin
    diffmax = d if d > diffmax
  }
end
#if (number == 100) 
puts (value / number)
puts (diff / number)
puts diffmin, diffmax
#value = 0
#number = 0
#end


