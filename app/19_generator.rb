
if __FILE__ == $0
    gen = Enumerator.new do |y|
        y << 'first'
        y << 'second'
        y << 'third'
    end
    
    puts gen.next
    puts gen.next
    puts gen.next
end