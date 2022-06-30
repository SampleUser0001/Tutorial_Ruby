class SampleClass
    def initialize(name = "World")
        @name = name
    end
    
    def printName()
        puts @name
    end
end
class SampleClass
    attr_accessor :name
end

sample = SampleClass.new("Hoge")
puts "sample.respond_to?('name') : #{sample.respond_to?('name')}" 
sample.printName

sample.name = "Piyo"
sample.printName

# これはエラー。
# sample.name
# sample.@name
