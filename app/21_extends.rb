require_relative 'lib/ExtendedSample'

if __FILE__ == $0
    sub = SubClass.new("hoge")
    puts sub.value
    puts sub.sampleMethod()
end