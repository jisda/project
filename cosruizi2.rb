require 'json'


puts JSON.parse('[1, 2, 3]')
#=> [1, 2, 3]

puts JSON.parse('{"foo" : "bar"}')
#=> {"foo"=>"bar"}



puts JSON.load('[1, 2, 3]')
#=> [1, 2, 3]

puts JSON.load('{"foo" : "bar"}')
#=> {"foo"=>"bar"}
