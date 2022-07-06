class SampleClass
    # コンストラクタ
    def initialize(value)
        # インスタンス変数
        @value = value
        @privateValue = 'privateValue'
    end

    def sampleFunc()
        puts "This is sampleFunc."
    end
    # public :sampleFunc
    # デフォルトはパブリック。
    
    # privateメソッド
    def privateSampleFunc()
        return @privateValue 
    end
    private :privateSampleFunc
    
    def putsPrivateValue()
        puts self.privateSampleFunc()
    end

    # クラスメソッド。インスタンスを生成しなくても呼べる。
    def self.classMethod()
        puts "This is classMethod."
    end

    attr_accessor :value
end