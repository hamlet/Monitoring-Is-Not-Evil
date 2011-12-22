#!/usr/bin/env ruby

exit if ARGV.length < 1
dst = (ARGV.length == 1) ? ARGV[0]+".date" : ARGV[1]
src = ARGV[0]

puts src,  "|=>", dst

start = `head -n 1 #{src}`.split(' ').first.to_i
fin = `tail -n 1 #{src}`.split(' ').first.to_i

puts start, fin

start_time = File.ctime(src) - ((fin - start) / 1000)
puts start_time

dst_file = File.open(dst, 'w')

File.foreach(src){|line|
sline = line.split(' ')
dst_file.puts (start_time + ((sline[0].to_i - start) / 1000)).strftime("%Y%m%d%H%M") + " " + sline[1..-1].join(' ')
}
