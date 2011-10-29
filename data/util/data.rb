#!/usr/bin/env ruby
start = 0
fin = 0
while a = gets
  /%(\d+)%/.match(a) {|m|
    start = m[1].to_i;
puts (start - fin).to_s + "ms pause" if fin != 0
  }
  /\+(\d+)\+/.match(a) {|m|
    fin = m[1].to_i;
if start != 0
    puts (fin - start) 
   puts (500*1000 / (fin-start)).to_s + ' Hz'
end
  }
end


