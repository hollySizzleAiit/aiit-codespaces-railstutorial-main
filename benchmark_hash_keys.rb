require 'benchmark'

N = 5_000_000

h_int  = { 1        => 'one' }
h_str  = { 'email'  => 'foo@example.com' }
h_sym  = { email: 'foo@example.com' }

Benchmark.bm(12) do |x|
  x.report('int key')    { N.times { h_int[1] } }
  x.report('string key') { N.times { h_str['email'] } }
  x.report('symbol key') { N.times { h_sym[:email]  } }
end
