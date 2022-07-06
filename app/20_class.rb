require_relative 'lib/Sample'

if __FILE__ == $0
    hoge = SampleClass.new('hoge')
    piyo = SampleClass.new('piyo')
    
    puts hoge.value
    p piyo.value
    
    hoge.sampleFunc()
    hoge.putsPrivateValue()

    # privateなので呼べない。
    # hoge.privateSampleFunc()
    
    SampleClass.classMethod()
end