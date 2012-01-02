#!/usr/bin/ruby -w

require 'digest/md5'

#puts !ARGV[0].nil?
if (!ARGV[0].nil?)
    puts Digest::MD5.hexdigest(ARGV[0])
else 
    puts 'input the String you want to calulate!'
end


