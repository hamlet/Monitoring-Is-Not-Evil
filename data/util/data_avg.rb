#!/usr/bin/env ruby
require "iconv"
#  Add methods to Enumerable, which makes them available to Array
module Enumerable
  #  sum of an array of numbers
  def sum
    return self.inject(0){|acc,i|acc +i}
  end
  #  average of an array of numbers
  def average
    return self.sum/self.length.to_f
  end
  #  variance of an array of numbers
  def sample_variance
    avg=self.average
    sum=self.inject(0){|acc,i|acc +(i-avg)**2}
    return(1/self.length.to_f*sum)
  end
  #  standard deviation of an array of numbers
  def standard_deviation
    return Math.sqrt(self.sample_variance)
  end
end  #  module Enumerable

values = []
errors_timing = 0
errors_overflow = 0
time = 0
while a = gets
  a= Iconv.conv('utf-8//IGNORE','utf-8', a)
  /(\d+) (\d+)/.match(a) {|m|
    errors_timing += 1 if (time + 2 != m[1].to_i) 
    errors_overflow += 1 if (m[2].to_i == 0 || m[2].to_i == 1023) 
    time = m[1].to_i
    values << m[2].to_i
  }
end
puts "Number of samples", values.length, "Average", values.average, "Deviation", values.standard_deviation, "Variance", values.sample_variance, "Errors timing", errors_timing, "Errors overflow", errors_overflow


