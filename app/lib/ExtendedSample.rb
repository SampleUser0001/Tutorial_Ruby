# 親クラス
class SuperClass
    attr_accessor :value
    def initialize(value)
        @value = value
    end
    
    # 抽象メソッド
    # 直接抽象メソッドを実装することはできないので、抽象メソッドとして扱いたいメソッドは親クラスで例外を投げるようにしておく。
    def sampleMethod()
        raise "Called abstract method: my_print"
    end
end

# 継承
class SubClass < SuperClass
    def sampleMethod()
        puts "This is SubClass."
    end
end