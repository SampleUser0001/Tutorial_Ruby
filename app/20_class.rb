require_relative 'lib/Sample'

if __FILE__ == $0
    hoge = SampleClass.new('hoge')
    piyo = SampleClass.new('piyo')
    
    puts hoge.value
    p piyo.value
end