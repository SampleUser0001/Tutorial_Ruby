class SampleClass
    def initialize(name = "World")
        @name = name
    end
    
    def printName()
        puts @name
    end
end

sample = SampleClass.new("Hoge")
sample.printName
# これはエラー。
# sample.name
# sample.@name
