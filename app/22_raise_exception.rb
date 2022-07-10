
def raiseException()
    raise RuntimeError.new("RuntimeError!!")
end

if __FILE__ == $0
    begin
        raiseException()
    rescue RuntimeError => e
        puts e
    end
end