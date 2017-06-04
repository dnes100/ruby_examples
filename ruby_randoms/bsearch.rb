require 'benchmark'

data = (0..50_00_000).to_a.shuffle


Benchmark.bm do |x|
  x.report(:find) { data.find { |n| n == 23_23_456 } }
  x.report(:bsearch) { data.bsearch { |n| n == 23_23_456 } }
end
